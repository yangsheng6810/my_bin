#!/bin/sh
# sudo modprobe kvm
# sudo modprobe kvm-intel
# sudo cpufreq-set -r -g performance
qemu-system-x86_64 -enable-kvm -drive file=/home/yangsheng/Downloads/kvm/winxp,if=virtio -smp 2 -m 1024 -soundhw es1370  -net nic,vlan=0,model=virtio -net user -usbdevice tablet
