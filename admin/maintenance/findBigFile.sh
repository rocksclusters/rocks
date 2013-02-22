#!/bin/bash
#set -x 
# Shows you the largest objects in your repo's pack file.
#
# taken from:
# http://stubbisms.wordpress.com/2009/07/10/git-script-to-show-largest-pack-objects-and-trim-your-waist-line/
#
# Heavily modified by 
# Clementi Luca
#

# set the internal field spereator to line break, so that we can iterate easily over the verify-pack output
IFS=$'\n';

if [ ! "$1" ]; then 
    echo "Usage:"
    echo "   $0 maxsize_in_byte"
    echo ""
    echo "Display only the file bigger that maxsize_in_byte present in your pack files"
    echo "All sizes are in byte. The format of the output is"
    echo "size  SHA  path"
    exit -1
fi

if [ ! -f .git/objects/pack/pack-*.idx ]; then 
    echo "you must run this script from the root directory of your repository."
    exit -1
fi


# list all objects including their size, sort by size,
objects=`git verify-pack -v .git/objects/pack/pack-*.idx | grep -v chain | sort -k3nr`

# no need for an header
# output="size,SHA,location"
for y in $objects
do
    # extract the size in bytes
    size=`echo $y | awk '{print $3}'`
    #echo "line  is $y"
    if [ "$size" -gt "$1" ] ; then
        # extract the compressed size in bytes
        # not needed
        # compressedSize=`echo $y | cut -f 4 -d ' '`
        # extract the SHA
        sha=`echo $y | awk '{print $1}'`
        # find the objects location in the repository tree
        other=`git rev-list --all --objects | grep $sha`
        #lineBreak=`echo -e "\n"`
        output="${output}\n${size},${compressedSize},${other}"
    fi
done

echo -e $output | column -t -s ', '

