#!/bin/sh
#############################
#
#A shortcut for connecting to remote desktop provided by kvm
#
#############################
rdesktop localhost:3389 -g workarea -u "yang" -p 123456 -r sound:local
