#!/bin/bash
#
# after reducing the size push the small repo back to github
# 

squize(){
ROLLNAME=$1
cd temp3_$ROLLNAME
  cd $ROLLNAME
    git remote set-url origin git@github.com:rocksclusters/${ROLLNAME}.git
    git push --all -f 
    git push --tags -f 
  cd ..
cd ..

}

for i in area51 backup bio ganglia hpc kernel perl python web-server; do
	squize $i;
done



