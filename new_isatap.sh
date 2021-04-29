#!/bin/sh
# Isatap behind NAT
#     :PROPERTIES:
#     :header-args:shell: :tangle ~/bin/new_isatap.sh
#     :header-args:shell+: :tangle-mode (identity #o755)
#     :header-args:shell+: :mkdirp yes :comments org :shebang "#!/bin/sh"
#     :END:
#   [[https://tuna.wiki/IsatapBehindNat][IsatapBehindNat - TUNA/CA wiki]]

NAME=sit1
SERVER=166.111.21.1
LOCAL=192.168.1.254
DORM=73.208.149.83
PREFIX_GLOBAL=2402:f000:1:1501:200:5efe
PREFIX_LINK=fe80::200:5efe

ip tunnel add "$NAME" mode sit remote "$SERVER" local "$LOCAL"
ifconfig "$NAME" up
ifconfig sit1 add "$PREFIX_GLOBAL":"$DORM"/64
ifconfig sit1 add "$PREFIX_LINK":"$DORM"/64

# Set up routing table

NEU6_IP="2001:da8:9000::232"
ip -6 route add "$NEU6_IP" via "$PREFIX_GLOBAL":"$SERVER" dev sit1
