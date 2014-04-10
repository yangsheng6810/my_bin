#!/bin/sh
NAME=sit1
SERVER=166.111.21.1
LOCAL=59.66.132.184
DORM=59.66.132.184
PREFIX_GLOBAL=2402:f000:1:1501:200:5efe
PREFIX_LINK=fe80::200:5efe

ip tunnel add "$NAME" mode sit remote "$SERVER" local "$LOCAL"
ifconfig "$NAME" up
ifconfig sit1 add "$PREFIX_GLOBAL":"$DORM"/64
ifconfig sit1 add "$PREFIX_LINK":"$DORM"/64
