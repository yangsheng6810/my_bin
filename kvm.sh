#!/bin/sh
sudo modprobe kvm
sudo modprobe kvm-intel
sudo cpufreq-set -r -g performance
qemu-kvm -enable-kvm -drive file=/home/yangsheng/down/winxpr.raw,if=virtio,cache=none -smp 2 -m 512 -soundhw es1370  -net nic,vlan=0,model=virtio -net user -daemonize -nographic -vnc 127.0.0.1:0 -redir tcp:3389::3389 
