#!/bin/bash
#
# When netease is available, call media keys on netease. Otherwise, call the
# default one. Intended to be used in i3 like this:
#

NETEASE_PID=$(pgrep netease)
if [ -z "$NETEASE_PID" ]; then
    playerctl $1
else
    playerctl --player=netease-cloud-music $1
fi
