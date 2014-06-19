#!/bin/bash
#
# remove binaries from git repo and create 
# corresponding .reponame.metadata file with sha1sum
# 
# I used this script doing cut and paste, it is not 
# meant to be used as a command line
# 
# Clem
#

find src/ -size +512k > files
find src/ -name "*.tar*" >> files
find src/ -name "*.rpm*" >>files
grep -v ".rpmmacros" files > tmp
mv tmp files
sort -u files > tmp
mv tmp files

echo verify that the content of files is correct
exit

for i in `cat files `; do  sha1sum $i;done > .$(basename `pwd`).metadata
git add .$(basename `pwd`).metadata
mkdir upload
for i in `cat files `; do cp $i upload/ ; done
if [ "`cat files | wc -l`" != "`ls -1 upload/|wc -l`" ]; then
	echo error some files have the same filename
	return 1
fi
for i in `cat files `; do git rm $i ; done
awk '{ if (a != 1) print ; if ($0 ~ /BEGIN/) a=1; }' ../base/.gitignore > .gitignore
cat files >> .gitignore
echo "# --- END ---" >> .gitignore 
git add .gitignore 

git commit -m "nobinary: remove big binaries from git repo"
git push


