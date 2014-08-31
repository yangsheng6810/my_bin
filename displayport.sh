#!/bin/sh
Xorg :9 -config ./1.conf -nolisten tcp -noreset -verbose 3 -isolateDevice 'PCI:01:00:0' -modulepath /usr/lib/nvidia/xorg/,/usr/lib/xorg/modules
