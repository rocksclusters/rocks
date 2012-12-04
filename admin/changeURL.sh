#!/bin/bash
#
# LC
# 
# Script used to change the URL of the subrepository
#


ScriptDir=`dirname $0`
BasePath=$ScriptDir/..

#TODO we need to make this a little more dinamic
sed -i "s/http:\/\/calit2-110-119-23.ucsd.edu\/git/root@calit2-110-119-23.ucsd.edu:\/state\/partition2\/git/g"    $BasePath/.gitmodules 

 


