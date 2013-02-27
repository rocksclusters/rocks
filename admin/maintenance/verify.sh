#!/bin/bash 
#
# Used to verify that the content of two folders are 
# same 
# it uses md5sum to verify that
#


if [ $1 ]; then 
    baseCVS=$1
else
    echo "Missing source directory"
    exit -1
fi

if [ $2 ]; then 
    baseGit=$2
else
    echo "Missing destination directory"
    exit -1
fi


#baseCVS=/home/clem/projects/rocks/code/rocks/src/roll/base/
#baseGit=/home/clem/projects/newgit/newbase/base/


cd $baseCVS
rm -f md5sum.txt
for i in `find . -type f | grep -v CVS | grep -v .git | grep -v .svn`; do 
    md5sum $i >> md5sum.txt
done 
cd -


cp  $baseCVS/md5sum.txt   $baseGit
cd $baseGit
md5sum -c md5sum.txt || echo --------    Error md5sum checking   ---------------
cd -


