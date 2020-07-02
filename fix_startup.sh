#!/bin/bash
if [ "$HOSTNAME" == "Desktop" ]; then
    xrandr --output HDMI-0 --primary
    fcitx5 &
else 
    fcitx &
fi
xset dpms 1800 3600 3600
