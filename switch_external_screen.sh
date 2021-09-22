#!/bin/bash

NUM_MONITOR=$(xrandr | grep '*' | wc -l)
echo $NUM_MONITOR

if [[ "$NUM_MONITOR" == 2 ]]; then
    ssh carbon 'DISPLAY=":0" xrandr --output eDP1 --scale 1x1 --mode 2560x1440 --rotate normal'
    ssh carbon 'DISPLAY=":0" xset +dpms s 1200 1200'
    killall x11vnc
    xrandr --output HDMI-1 --off --output HDMI-0 --mode "2560x1440" --pos 0x0
else
    ssh carbon 'DISPLAY=":0" xrandr --output eDP1 --scale 1x1 --mode 1600x900 --rotate right'
    ssh carbon 'DISPLAY=":0" xset -dpms s off'
    xrandr --output HDMI-1 --mode "1600x900" --pos 2560x180 --rotate left --output HDMI-0 --mode "2560x1440" --pos 0x0
    x11vnc -usepw -nocursorshape -nocursorpos -nobell -noxinerama -solid -repeat -forever -clip 900x1600+2560+180 &
fi
