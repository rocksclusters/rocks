#!/bin/bash
#
# LC
# 
# Script used to change the URL of the subrepository
#


ScriptDir=`dirname $0`
BasePath=$ScriptDir/..

pushd $BasePath

repoList=`git submodule |awk '{print $2}'`

#TODO we need to make this a little more dinamic
for i in $repoList;
do
    pushd $i
    git checkout master
    popd 
done

popd
git status



 


