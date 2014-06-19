#!/bin/bash 
#
#
# Clem
# this script removes from the current HEAD all the way back 
# all the references to the files listed in the file passed 
# as a first argument.
# Only file not currently present in the working direcotry 
# are deleted
#
# This script can be used to reduce the size of a git repo
#
# ATT: this script will rewrite all the histrory of the repo
# aka it is dangerous: BACKUP YOU REPO
#
# If you have unmerged branches this script will not work properly,
# it will leave the unmerged branched untouched and they will
# keep on referencing the data.
# 


# Check arugments
if [ -f "$1" ];then
    inputFile=$1;
else 
    echo "Error no arguments specified"
    echo "Usage: "
    echo "    $0 fileList "
    exit -1;
fi

# 
# check we are at the top directory
# 
if [ ! -d ".git" ]; then 
    echo "Error this command should be run from the top level directory of your git repo"
    exit -1
fi

fileList=""
for i in `awk '{print $3}' $inputFile`;do 
    if [ -f $i ]; then 
        echo "  Skipping file $i"
    else 
        echo "  Removing file $i"
        fileList="$fileList $i"
    fi

done


#mkdir upload 
#git cat-file -p f520482244a7e5ecab44aa1d54dc651afdce0ddd > src/foundation-gd/gd-2.0.33.tar.gz


echo git count-objects -v -- before files deletion
git count-objects -v

echo "Running filter branch"
git filter-branch --index-filter "git rm --cached --ignore-unmatch $fileList" --tag-name-filter cat -- --all

# 
# now we really delete old unused stuff
# 
#rm -rf .git/refs/original/
#git reflog expire --all --expire='0 days' 
#git repack -A -d
#git prune

echo 'objects have been deleted not you have to clone this repo to see the difference in size'
#echo '
#git branch -D ROCKS_5_3_1 
#git reflog expire --expire=now --all
#git gc --aggressive --prune=now
#git repack -a -d -l
#'


