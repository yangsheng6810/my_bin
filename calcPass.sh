#!/bin/sh
user=`whoami`
if [ "$user" != "root" ]; then
	echo "Not root!"
else
	echo -n "Type in the string:"
	read -s password
	#echo $password
	echo
	ans=`echo $password|md5sum`
	echo "The answer is $ans"
fi
