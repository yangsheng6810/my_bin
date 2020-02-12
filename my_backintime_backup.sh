#!/bin/sh
if [ -d "/run/media/yangsheng/Backup" ]; then
    /usr/bin/nice -n 19 /usr/bin/ionice -c2 -n7 /usr/bin/backintime --profile-id 2 backup-job >/dev/null 2>&1
fi
