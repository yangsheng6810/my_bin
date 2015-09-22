#!/bin/sh
ifconfig sit0 up
ifconfig sit0 inet6 tunnel ::216.218.221.6
ifconfig sit1 up
ifconfig sit1 inet6 add 2001:470:18:f40::2/64
route -A inet6 add ::/0 dev sit1
