#!/bin/bash
#
# LC
#
# if you want to checkout only the head of the tree
#

BasePath=`dirname $0`
ModuleFile=$BasePath../.gitmodules

pushd $BasePath/..
git submodule init
for i in $(git submodule | sed -e 's/.* //'); do
    spath=$(git config -f .gitmodules --get submodule.$i.path)
    surl=$(git config -f .gitmodules --get submodule.$i.url)
    git clone --depth 1 $surl $spath
done
git submodule update
popd

