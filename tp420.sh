#!/bin/sh
# Power control for Thinkpad T420 by Erik Andresen
# based on Power control for Asus 1215N Optimus by Pete Eberlein

if ! lsmod | grep -q acpi_call; then
	echo "Error: acpi_call module not loaded"
	exit
fi

acpi_call () {
	echo "$*" > /proc/acpi/call
	cat /proc/acpi/call
}


case "$1" in
	off)
		#modprobe -r nvidia
		echo _DSM $(acpi_call "\_SB.PCI0.PEG.VID._DSM" \
			"{0xF8,0xD8,0x86,0xA4,0xDA,0x0B,0x1B,0x47," \
			"0xA7,0x2B,0x60,0x42,0xA6,0xB5,0xBE,0xE0}" \
			"0x100 0x1A {0x1,0x0,0x0,0x3}")
		echo _PS3 $(acpi_call "\_SB.PCI0.PEG.VID._PS3")
		;;
	on)
		echo _PS0 $(acpi_call "\_SB.PCI0.PEG.VID._PS0")
		modprobe nvidia
		;;
	*)
		echo "Usage: $0 [on|off]"
esac
