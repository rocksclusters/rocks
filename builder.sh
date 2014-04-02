#!/bin/sh

echo "Builder.sh Starting at `date`"

## Build the rocksbuild (1st pass)
## This adds some updated versions of packages, as needed
pushd src/roll/rocksbuild
make buildrpms 
popd

## Now source 
. /etc/profile.d/rocks-devel.sh

BUILDROLL=src/roll/rocksbuild/build-roll.sh

FIRSTPASSROLLS="base rocksbuild kernel" 

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
    df -h
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

# Build remaining rolls 
# Order is important
ROLLS="area51"

if ! ps aux|grep condor_master > /dev/null ; then  
	# we can build condor only if there is no condor running
	ROLLS="$ROLLS condor"
fi

ROLLS="$ROLLS cvs-server ganglia hpc java sge web-server python perl bio zfs-linux fingerprint_roll"


OSVERSION=`lsb_release -rs | cut -d . -f 1`
if [ $OSVERSION -eq 5 ]; then
	ROLLS+=" xen"
else
	if [ "`/bin/arch`" == "x86_64" ]; then 
		ROLLS+=" kvm zfs-linux" 
	fi
fi

echo "Builder.sh Rolls: $ROLLS"

for i in $ROLLS; do
	echo "Building Roll: $i. See /tmp/build-$i.out"
    df -h
	$BUILDROLL -s -z -p src/roll  $i &> /tmp/build-$i.out
done
echo "Builder.sh Complete at `date`"
