#!/bin/bash
#
#

squize(){

ROLLNAME=$1
ROLLPATH=/home/clem/projects/rocks/rocks/src/roll

echo Processing $ROLLNAME

cd $ROLLPATH
mkdir temp_$ROLLNAME
cd temp_$ROLLNAME
  git clone file://$ROLLPATH/$ROLLNAME
  cp ../$ROLLNAME/files $ROLLNAME
  cd $ROLLNAME
    git checkout -b ROCKS_6_1_1 --track origin/ROCKS_6_1_1
    git checkout master
    $ROLLPATH/removeFileFromHistoryKnownFiles.sh files
  cd ..
cd ..

# second pass make it really small
mkdir temp2_$ROLLNAME
cd temp2_$ROLLNAME
  git clone file://$ROLLPATH/temp_$ROLLNAME/$ROLLNAME
  cd $ROLLNAME
    git checkout -b ROCKS_6_1_1 --track origin/ROCKS_6_1_1
    git checkout master
    $ROLLPATH/../../admin/maintenance/findBigFile.sh 400000 > new_files
    echo edit new_file
    test "`wc -l new_files|awk '{print $1}'`" != "0" && vim new_files
    test "`wc -l new_files|awk '{print $1}'`" != "0" && $ROLLPATH/../../admin/maintenance/removeFileFromHistory.sh new_files
  cd ..
cd ..

#small repo now move the path
mkdir temp3_$ROLLNAME
cd temp3_$ROLLNAME
  git clone file://$ROLLPATH/temp2_$ROLLNAME/$ROLLNAME
  du -sh $ROLLNAME
  cd $ROLLNAME
  git checkout -b ROCKS_6_1_1 --track origin/ROCKS_6_1_1
  git checkout master
  #  ROLLNAME=base git filter-branch --index-filter  'git ls-files -s | sed "s-\t\"*-&src/roll/$ROLLNAME/-" | GIT_INDEX_FILE=$GIT_INDEX_FILE.new git update-index --index-info && mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE"' --tag-name-filter cat -- --all
  cd ..
cd ..

}

for i in base area51 backup bio ganglia hpc java kernel perl python sge web-server; do
	squize $i;
done



