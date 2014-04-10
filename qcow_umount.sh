#!/bin/sh
sudo umount /dev/nbd0p1
sudo qemu-nbd -d /home/yangsheng/down/winxp.qcow
