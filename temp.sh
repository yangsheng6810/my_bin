#!/bin/sh
isatap_server=166.111.21.1

if [ $# -ne 1 ] ; then
echo "Usage: $0 interface";
exit 1;
fi

iface=$1

#ifconfig $iface del 2001:da8:215:3320:223:aeff:fe5d:3b10/64
sudo sysctl -w net.ipv6.conf.default.accept_ra=0
sudo ip -6 addr flush dev $iface scope global
sudo ip -6 route del dev $iface

iface_inet=$(ip addr show dev $iface scope global|grep "scope global ${iface}" | awk '{print $2}' | awk -F "/" '{print $1}')

#ip tunnel add sit1 mode sit ttl 128 remote 211.68.71.43 local 59.64.153.123
sudo ip tunnel add sit1 mode sit ttl 128 remote $isatap_server local $iface_inet
sudo ifconfig sit1 up
#ifconfig sit1 add 2001:da8:215:5200::5efe:59.64.153.123
sudo ifconfig sit1 add 2001:da8:215:5200::5efe:${iface_inet}
sudo ip -6 route add default dev sit1

echo "ISATAP tunnelling via ${iface} has been enabled."

