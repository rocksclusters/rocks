#!/bin/bash
#
# This is script was use to first create the now backup repo
# and then to upload 
#
#

createrepo(){
	# This create a new empty repository in github
	# 
	user="username:pass"
	repo=$1
	
	curl -i -u "$user" -d "{ \"name\": \"$repo\", \"description\": \"Old $repo repository with code for release 6.0 6.1 6.1.1\", \"homepage\":\"http://www.rocksclusters.org/\"}"  https://api.github.com/orgs/rocksclusters-attic/repos
	sleep 5
}

upload(){
	# this clone the old reporsity and then it upload it in the
	# new repository
	oldurl="git@github.com:rocksclusters/"
	newurl="git@github.com:rocksclusters-attic/"
	repo=$1
	
	git clone ${oldurl}${repo}.git
	
	cd $repo
	  git remote add temp_backup "${newurl}${repo}.git"
	  git push --all temp_backup
	  git push --tags temp_backup
	cd ..
}

#for i in base area51 backup bio ganglia hpc java kernel perl python sge web-server; do
for i in web-server; do
	upload $i;
done



