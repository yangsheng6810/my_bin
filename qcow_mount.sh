#!/bin/sh
sudo modprobe nbd max_part=63
sudo qemu-nbd --connect=/dev/nbd0 /home/yangsheng/down/winxp.qcow
sudo mount /dev/nbd0p1 /media/cdrom
