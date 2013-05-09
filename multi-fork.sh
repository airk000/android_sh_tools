#!/bin/bash
#
# Writen by liukai@shenduos@2013.03.08 for multi-fork from Github to our own organization
#

SOURCEFILE=$1
SOURCEUSER=CyanogenMod
DESUSER=<your github username>
DESPWD=<your github password>
ORGANIZATION=TestProject
COUNTS=`ls $SOURCEFILE | wc -l`
c=0
for i in `ls $SOURCEFILE`
do
{
    SOURCEGIT=${i%.git}
    curl -i -u "$DESUSER:$DESPWD" --data '{"organization": "TestProject"}' -X POST https://api.github.com/repos/$SOURCEUSER/$SOURCEGIT/forks
    clear
#    echo -e "$DESUSER:$DESPWD" --data '{"organization": "TestFork"}' -X POST https://api.github.com/repos/$SOURCEUSER/$SOURCEGIT/forks
    
    ((c++))
    j=$((c*1*100/COUNTS))
    echo 
    echo
    echo -e "Forking $SOURCEUSER/$SOURCEGIT to TestProject/$SOURCEGIT"
    echo
    echo -e "==========>>$j%<<==========="
    echo
} 
done
