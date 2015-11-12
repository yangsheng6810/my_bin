#!/bin/sh
ifconfig sit0 up
ifconfig sit0 inet6 tunnel ::74.82.46.6
# ifconfig sit0 inet6 tunnel ::216.218.221.6
ifconfig sit1 up
ifconfig sit1 inet6 add 2001:470:23:cc5::2/64
# ifconfig sit1 inet6 add 2001:470:18:3f0::2/64
route -A inet6 add ::/0 dev sit1
