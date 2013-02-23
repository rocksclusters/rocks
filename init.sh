#!/bin/bash
#
# clone all the subrepo
#



SubModule=`cat .gitignore`

remote=`git remote -v|awk '{print $2}'|head -n 1`
baseRemote=`dirname $remote`

pushd src/roll

for i in $SubModule;
do 
    modName=`basename $i`
    echo "  Cloning $baseRemote/$modName.git repository" 
    git clone $baseRemote/$modName.git $modName
done

popd

