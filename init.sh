#!/bin/bash
#
# clone all the subrepo
#

function print_help(){
	echo "./init.sh [--tags TAGNAME | --source | -h]"
	echo ""
	echo "		--source         check out only the source code and not the entire GIT repo"
	echo "		--tags TAGNAME   download the TAGNAME version of the code"
	echo ""
}


while [ $# -ge 1 ]; do
	case "$1" in
		--)
			# No more options left.
			shift
			break
			;;
		--source)
			SOURCE=true
			baseURL="http://github.com/rocksclusters"
			;;
		--tag)
			tag_name=$2
			shift
			;;
		-h)
			print_help
			exit 0
			;;
	esac
	shift
done

SubModule=`cat .gitignore`

remote=`git remote -v|awk '{print $2}'|head -n 1`
baseRemote=`dirname $remote`

start_time=$(date +%s)

pushd src/roll
for i in $SubModule;
do 
	modName=`basename $i`
	if [ "$SOURCE" ]; then
		#if tag_name is not defined set it to master
		test $tag_name || tag_name=master
		wget -nv -O $modName.tar.gz $baseURL/$modName/archive/$tag_name.tar.gz || exit -1
		tar -xzf $modName.tar.gz || exit -1
		mv $modName-$tag_name $modName || exit -1
		rm $modName.tar.gz
	else
		echo "  Cloning $baseRemote/$modName.git repository" 
		git clone $baseRemote/$modName.git $modName || exit -1
		echo tag name $tag_name
		if [ "$tag_name" ]; then
			pushd $modName
			git checkout "$tag_name"
			popd
		fi

	fi
done
popd

finish_time=$(date +%s)
echo "Time duration: $((finish_time - start_time)) secs."

