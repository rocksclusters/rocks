#!/bin/bash
#
# LC
#
# if you want to checkout only the head of the tree
#

echo "Not used anymore (now this repo does not use submodule any more)"
exit -1 

BasePath=`dirname $0`
ModuleFile=$BasePath../.gitmodules

pushd $BasePath/..
git submodule init
BasePath=`git config --get remote.origin.url`
BasePath=`dirname $BasePath`
for i in $(git submodule | sed -e 's/.* //'); do
    spath=$(git config -f .gitmodules --get submodule.$i.path)
    surl=$(git config -f .gitmodules --get submodule.$i.url)
    surl=`basename $surl`
    git clone --depth 1 $BasePath/$surl $spath
done
git submodule update
popd

