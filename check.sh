#!/bin/sh
FROM="$1"
TO="$2"
for i in ./$FROM/*;do
    str=`md5sum $i`
    strr=`md5sum $TO/$i`
    if [ "${str}" = "${strr}" ]; then
        echo "check $i is OK"
    else
        echo "!!!!!! "
        echo "check $i failed"
    fi
done
