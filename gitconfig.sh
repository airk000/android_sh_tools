#!/bin/bash
#
# Writen by liukai@shenduos@2013.03.05 for Gerrit
#
function usage
{
	echo -e "Usage:"
	echo -e "\t$(basename $0) [dir]"
	echo
	echo -e "Check all *.git under [dir], find \"remote\" in its config, then add \"review\""
	echo -e "and \"projectname\" to it."
	exit 0
}

if [ -z "$1" ]
then
	usage
fi

for i in `ls $1`
do
	var=$i;
	projectname="projectname = $1"${var%.git};
	review="review = 192.168.1.107";
	find $1/$i -name config -exec sed "/^\[remote/a\\\t$review\n\t$projectname" {} \;
done
