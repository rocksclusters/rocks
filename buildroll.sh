#!/bin/sh
BUILDROLL=src/roll/rocksbuild/build-roll.sh
ROLLS=$*

#
# download all the binaries first 
# this is to avoid downloading error all the way down into the compilation
# and fail sooner than later
#
for roll in $ROLLS; do

	if ls src/roll/$roll/.*.metadata ; then
		echo "Downloading binaries for $roll"
		pushd src/roll/$roll
		#
		# try it twice, if it fails twice abort
		make download || make download || exit 1
		popd
	fi
done

echo "buildroll.sh Rolls: $ROLLS"

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

echo "buildroll.sh Complete at `date`"
