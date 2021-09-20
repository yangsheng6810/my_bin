#!/bin/sh
sleep 2
echo "start $(date)" >> /tmp/wacom-config.log
echo "DISPLAY: ${DISPLAY}" >> /tmp/wacom-config.log
echo "XAUTHORITY: ${XAUTHORITY}" >> /tmp/wacom-config.log
list=$(xsetwacom list devices)
echo "list: ${list}" >> /tmp/wacom-config.log
xsetwacom --set "Wacom Bamboo One M Pen stylus" Area 0 0 21648 12177
xsetwacom --set "Wacom Bamboo One M Pen stylus" MapToOutput HEAD-0
