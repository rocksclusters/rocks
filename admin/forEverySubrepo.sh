#!/bin/bash
#
# LC
# 
# run a command on each subrepo
#

function usage(){
	echo " Usage:"
	echo "      $0 <command>"
	echo 
	echo "For each submoudle present in this repository it run the given <command> in "
	echo "the submodule path."

}


if [ ! "$1" ]; then 
	usage;
	exit -1;
fi

# Base path where the script is
# http://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
pushd `dirname $0` > /dev/null
ScriptDir=`pwd -P`
popd > /dev/null
BasePath=$ScriptDir/..

repoList=`cat $BasePath/.gitignore`

#TODO we need to make this a little more dinamic
for i in $repoList;
do
    pushd $i  &> /dev/null
    echo "  --------------------  Repository `basename $i`  "
    $@
    popd  &> /dev/null
done




 


