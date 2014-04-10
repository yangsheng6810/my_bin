#!/bin/sh
cpupower -c all frequency-set -r -g performance
modprobe -r vboxdrv
modprobe -r xhci_hcd
modprobe -r ehci_hcd
