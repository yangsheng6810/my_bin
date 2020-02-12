#!/bin/sh
GATEWAY="`ip route show |grep default |grep wlp4s0|cut -d " " -f 3`"
DEST="$1"
echo "Making direct link to $DEST"
sudo ip route add to $DEST via $GATEWAY dev wlp4s0
