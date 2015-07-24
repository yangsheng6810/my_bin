#!/bin/bash
json=`proxychains wget -q -O - 'http://privateinternetaccess.com/vpninfo/servers?version=24' | head -1`

echo $json

