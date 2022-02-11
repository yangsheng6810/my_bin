#!/bin/bash
#
# When netease is available, call media keys on netease. Otherwise, call the
# default one. Intended to be used in i3 like this:
#

NETEASE_PID=$(pgrep netease)
MPV_PID=$(pgrep mpv)
YESPLAYMUSIC_PID=$(pgrep yesplaymusic)
if [ -n "$MPV_PID" ]; then
    playerctl --player=mpv "$1"
    exit
fi
if [ -n "$YESPLAYMUSIC_PID" ]; then
   playerctl --player=yesplaymusic "$1"
   exit
fi
if [ -n "$NETEASE_PID" ]; then
   playerctl --player=netease-cloud-music "$1"
   exit
fi

# no match
playerctl "$1"
