#!/bin/bash
if test `id -u` != 0; then
    exec sudo "$0" "$@"
fi

stamp=`date +%Y%m%d%H%M`

exec > "$stamp".txt

myip() {
    echo >&2 "Getting your public IPv6 address"
    if type wget >/dev/null; then
        wget -qO- 'http://ipv4.icanhazip.com'
    elif type curl >/dev/null; then
        curl 'http://ipv4.icanhazip.com'
    else
        echo >&2 "Neither of wget and curl found. Install one of them. Abort."
        exit 1
    fi
}

ip=`myip`

echo "IP: $ip"

targets='166.111.8.28 www.baidu.com www.youku.com 8.8.8.8 kernel.org'
for t in $targets; do
    echo >&2 "Testing against $t"
    sudo ping -fqc 100 $t
    echo
done

echo >&2 "Complete. Data saved in $stamp.txt."
