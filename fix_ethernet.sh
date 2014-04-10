#!/bin/sh
user=`whoami`
if [ "x$user" != "xroot" ]; then
	echo "Not root!"
else
	echo on > /sys/class/net/enp0s25/device/power/control
fi
