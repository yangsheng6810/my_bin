#!/bin/sh
openvpn /home/yangsheng/Downloads/vpn/link/client.ovpn
ip link set up dev tap0  
dhcpcd -6 tap0
