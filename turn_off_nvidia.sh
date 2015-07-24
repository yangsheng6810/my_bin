#!/bin/sh
user=`whoami`
if [ "x$user" != "xroot" ]; then
	echo "Not root!"
else
	if [ "x$1" = "xon" ]; then
		tee /proc/acpi/bbswitch <<<ON
	else
		tee /proc/acpi/bbswitch <<<OFF
	fi
	state=`cat /proc/acpi/bbswitch`
	echo "current state is ${state#* }"
fi
