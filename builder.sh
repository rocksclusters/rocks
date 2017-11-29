#!/bin/sh

echo "Builder.sh Starting at `date`"
echo "Setting SELINUX to permissive (lorax in kernel roll)"
/usr/sbin/setenforce 0

## Build the rocksbuild (1st pass)
## This adds some updated versions of packages, as needed
pushd src/roll/rocksbuild
make buildrpms 
popd

## Now source 
. /etc/profile.d/rocks-devel.sh

BUILDROLL=src/roll/rocksbuild/build-roll.sh

FIRSTPASSROLLS="base rocksbuild kernel" 
FIRSTPASSROLLS="core base kernel" 

# Build remaining rolls 
# Order is important

pgrep condor_master > /dev/null
if [ $? -ne 0 ]; then  
	# we can build condor only if there is no condor running
	#
	# when we build on batlab we can't build condor or we crash
	# the machine
	ROLLS="$ROLLS condor"
fi

ROLLS="$ROLLS ganglia hpc java sge web-server python perl bio fingerprint_roll kvm zfs-linux"
ROLLS="ganglia hpc python fingerprint_roll kvm zfs-linux openvswitch sge condor perl rabbitmq-roll img-storage-roll"
ROLLS="$ROLLS area51"

#
# download all the binaries first 
# this is to avoid downloading error all the way down into the compilation
# and fail sooner than later
#
for roll in $FIRSTPASSROLLS $ROLLS; do

	if ls src/roll/$roll/.*.metadata ; then
		echo "Downloading binaries for $roll"
		pushd src/roll/$roll
		#
		# try it twice, if it fails twice abort
		make download || make download || exit 1
		popd
	fi
done
df -h



for fproll in $FIRSTPASSROLLS; do 
	echo "--- Starting build of $fproll: `date`"
	echo "Building First Pass Roll: $fproll"
	$BUILDROLL -z -p src/roll $fproll &> /tmp/build-$fproll.out 
	if [ ! -f src/roll/$fproll/$fproll*iso ]; then
		echo "Could not Create roll $fproll. Aborting"
		exit 127
	fi

	rocks list roll $fproll &> /dev/null
	if [ $? == 0 ]; then
		echo "Removing old $fproll roll"
		rocks remove roll $fproll
	fi
	pushd src/roll/$fproll
	rocks add roll $fproll*iso 
	rocks enable roll $fproll
	# Special handling of base roll. to create rocks-anaconda-updates,
        # various rocks-created RPMS need to be in the distribution.
	if [ "$fproll" == "base" ]; then
		make -C src/updates.img rpm
		make reroll
		rocks add roll $fproll*iso clean=y
	fi
	popd
	echo "--- Completed build of $fproll: `date`"
done

if [ "$FIRSTPASSROLLS" != "" ]; then
	pushd /export/rocks/install
	rocks create distro
	popd
fi 

# Source the import startup files

. /etc/profile.d/rocks-binaries.sh
. /etc/profile.d/java.sh
. /etc/profile.d/modules.sh


echo "Builder.sh Rolls: $ROLLS"

for i in $ROLLS; do
	echo "Building Roll: $i. See /tmp/build-$i.out"
	df -h
	$BUILDROLL -s -z -p src/roll  $i &> /tmp/build-$i.out

	# some rolls are inside a directory whose name is not the same
	# as the ROLLNAME 
	rollname=`awk -F = '/ROLLNAME/ {print $NF}' src/roll/$i/version.mk | awk '{print $1}'`
	test "$rollname" || rollname=$i
	if [ ! -f src/roll/$i/${rollname}*iso ]; then
		echo "Unable to create roll ${i}. Aborting!"
		exit 127
	fi

	rocks list roll $rollname &> /dev/null
	if [ $? == 0 ]; then
		echo "Removing old $rollname roll"
		rocks remove roll $rollname
	fi
	pushd src/roll/$i
	rocks add roll $rollname*iso
	rocks enable roll $rollname
	popd
done

# we need to rebuild the distro before we can make the os roll
pushd /export/rocks/install
rocks create distro
popd
df -h
# $BUILDROLL -s -z -p src/roll os &> /tmp/build-os.out


echo "Builder.sh Complete at `date`"
