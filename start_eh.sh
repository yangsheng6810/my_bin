#!/bin/bash
# Cron + tmux statup script
# Approach was taken from http://www.nburles.co.uk/linux/starting-a-process-in-a-tmux-session-using-cron

# Sleep for 5 seconds. If you are starting more than one tmux session 
#   "at the same time", then make sure they all sleep for different periods
#   or you can experience problems
/bin/sleep 5
source $HOME/.shell/load.sh

SESSION_NAME=mystartup
/usr/bin/tmux set-option  -g  default-shell /usr/bin/zsh
/usr/bin/tmux new-session -ds $SESSION_NAME                   "zsh"
# Execute <COMMAND #1> and then run bash to save output. Without bash tmux window will close and you can't see any errors if they occured.
/usr/bin/tmux new-window -dt $SESSION_NAME -n "ehforwarderbot"  "ehforwarderbot; zsh"

# Installing script:
# touch $HOME/startup.cron
# chmod +x $HOME/startup.cron
# crontab -e
# @reboot $HOME/startup.cron
# vim $HOME/startup.cron
# and insert this file content...

# Attaching 
#tmux attach-session -t mystartup
