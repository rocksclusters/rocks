#!/bin/bash
#
# LC
# 
# Script used to change the URL of the subrepository
#


ScriptDir=`dirname $0`
BasePath=$ScriptDir/..

sed -i "s/root@calit2-110-119-23.ucsd.edu/root@calit2-110-119-23.ucsd.edu/gc"    $BasePath/.gitmodules 

 


