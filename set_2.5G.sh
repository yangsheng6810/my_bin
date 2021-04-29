#!/bin/sh
ip addr add 10.0.1.2/24 dev enp2s0f0u4c2
ip link set enp2s0f0u4c2 up

function my_test() {
    sleep 10
    ping -c 2 10.0.1.1 >> /tmp/ping_2.5G.log
}

# my_test &
