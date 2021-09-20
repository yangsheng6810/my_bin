#!/bin/bash
#
# When netease is available, call media keys on netease. Otherwise, call the
# default one. Intended to be used in i3 like this:
#

NETEASE_PID=$(pgrep netease)
MPV_PID=$(pgrep mpv)
if [ -n "$MPV_PID" ]; then
    playerctl --player=mpv $1
else
    if [ -n "$NETEASE_PID" ]; then
        playerctl --player=netease-cloud-music $1
    else
        playerctl $1
    fi
fi
