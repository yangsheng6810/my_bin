#!/bin/sh
case "$1" in
	eth)
		ip tunnel add sit1 mode sit remote \
			166.111.21.2 local 59.66.132.184
		ifconfig sit1 up
		ifconfig sit1 add 2402:f000:1:1501:200:5efe:59.66.132.184/64
		# ip route add ::/0 via 2402:f000:1:1501 metric 1
		;;
	wlan)
		ipaddr=`ifconfig wlan|grep --color=NEVER 'inet '|sed -r 's/inet ([0-9.]+) [a-z0-9. ]+/\1/g'`
		echo ${ipaddr}
		ip tunnel add sit1 mode sit remote \
			166.111.21.2 local ${ipaddr}
		ifconfig sit1 up
		ifconfig sit1 add 2402:f000:1:1501::${ipaddr}/64
		# ip route add ::/0 via 2001:da8:200:900e::1 metric 1
		;;
	*)
		echo "Usage: $0 [eth|wlan]"
esac
