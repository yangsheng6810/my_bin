#!/bin/sh
modprobe  vboxdrv
modprobe  xhci_hcd
modprobe  ehci_hcd
cpupower -c all frequency-set -r -g ondemand
