#!/bin/sh
echo "$1"
ans=`whoami`
if [ "${ans}" != "root" ] ; then
	echo "not root"
	exit
fi
if [[ "$1" =~ [0-9]+ ]] ; then
	echo "$1"> /sys/class/backlight/acpi_video0/brightness 
else
	echo "Not int!"
fi
