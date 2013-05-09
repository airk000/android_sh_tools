#!/bin/bash
#
# Writen by liukai@shenduos@2013.03.05 for Gerrit
#
function usage
{
	echo Usage:
	echo -e "\t$(basename $0) [dir]"
	echo
	echo -e "Check all directory under [dir], if any directory's prefix name is not match"
	echo -e "\"android_\", rename it with \"android_\" prefixion."
	exit 0
}

if [ -z "$1" ]
then
	usage
fi
for i in `ls $1`
do
	if [[ $i != android*.git ]];
	then
	#	mv $i android_$i;
		echo "[$i]-->>[android_$i]";
	fi
done
