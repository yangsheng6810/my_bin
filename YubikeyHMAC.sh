#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]
  then
    echo "Usage YubikeyHMAC:"
    echo " Path of KeepassXC Database with Argon2 (KDBX 4)"
    echo " Secret key"
    echo " Keyfile name to write to"
    echo " Example ./YubikeyHMAC.sh Passwords.kdbx \"ed163d2e495acb652e5d2ecb103429064dd97c6a\" Keyfile"
    exit 0
fi
xxd -p -c 33 -s 0xc5 -l 32 $1 | xxd -r -p | openssl dgst -sha1 -hmac "$(echo -n $2 | xxd -r -p)" | cut -c 10- | xxd -r -p > $3
