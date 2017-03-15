#!/bin/bash
NUMBER_OF_MONITOR=`xrandr |grep -w connected |wc -l`
if [ ${NUMBER_OF_MONITOR} -eq 1 ]; then
    xrandr --output eDP1 --scale 1x1
else
    xrandr --output DP1 --scale 1.75x1.75
    xrandr --output eDP1 --scale 1x1
    xrandr --output DP1 --pos 0x0
    xrandr --output eDP1 --pos 3360x0
fi
