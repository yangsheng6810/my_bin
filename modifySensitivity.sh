#!/bin/sh
user=`whoami`
if [ "$user" != "root" ]; then
	echo "Not root!"
else
	cd /sys/devices/platform/i8042/serio1/serio2
	echo 200 > sensitivity
fi
