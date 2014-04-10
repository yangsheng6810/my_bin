#!/bin/sh
user=`whoami`
if [ "x$user" != "xroot" ]; then
	echo "Not root!"
else
	tee /proc/acpi/bbswitch <<<ON
fi
