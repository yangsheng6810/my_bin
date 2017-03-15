#!/bin/sh
cd /home/yangsheng/Downloads/vpn/link
openvpn client.ovpn &
sleep 10
ip link set up dev tap0  
dhcpcd -6 tap0
