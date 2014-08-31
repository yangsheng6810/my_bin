#!/bin/bash -e
# $File: setup-ipv6.sh
# $Date: Fri Mar 07 13:00:05 2014 +0800
# $Author: jiakai <jia.kai66@gmail.com>
 
PREFIX='2402:f000:1:1501:200:5efe'
ADDR_LOCAL=$(ip r g 8.8.8.8 | grep src | awk '{print $7}')
##################
# ifconfig.me is used to get external ip addr
##################
# ADDR_OUT=$(curl ifconfig.me)
##################
# in case ifconfig.me is not useable
##################
ADDR_OUT=$ADDR_LOCAL
ADDR_REMOTE='166.111.21.1'
 
echo "local: $ADDR_LOCAL"
echo "out: $ADDR_OUT"
 
ip tunnel del sit1 &>/dev/null && echo 'del sit1'
ip tunnel add sit1 mode sit remote $ADDR_REMOTE local $ADDR_LOCAL
ifconfig sit1 up
ifconfig sit1 add $PREFIX:$ADDR_OUT/64
while true
do
	ip -6 r del default &> /dev/null || break
done
ip r add ::/0 via $PREFIX:$ADDR_REMOTE metric 1
 
echo 'Done.'
