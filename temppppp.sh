#!/usr/bin/bash

for i in /sys/class/net/*; do
    echo "==$i"
    udevadm test-builtin net_id "$i";
    echo
done 2>/dev/null
