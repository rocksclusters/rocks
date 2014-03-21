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
	echo ""
	echo "To delete all the downloaded subrepo use:"
	echo -e "    ./admin/forEverySubrepo.sh 'cd ../../..; rm -rf \$repo_name'"

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
	if [ -d "$i" ]; then
		pushd $i  &> /dev/null
		echo "  --------------------  Repository `basename $i` repo_name=$i "
		export repo_name=$i
		eval "$@"
		popd  &> /dev/null
	fi
done




 


