#!/bin/bash
HOSTNAME=`hostname`
PORT=15522
LOCAL_PORT=10022
SSH_PORT=8022
LOCAL_SSH_PORT=8022
USER=yangsheng
echo "$HOSTNAME"
case "$HOSTNAME" in 
    "myhost") PORT=15022
        echo "in myhost"
        ;;
    "carbon") PORT=15122
        echo "in carbon"
        ;;
    "pi_yangsheng") PORT=15222
        LOCAL_SSH_PORT=9022
        ;;
    *) PORT=15522
esac
createTunnel() {
    /usr/bin/ssh -p "$SSH_PORT" -f -N \
        -R "$PORT":localhost:"$LOCAL_SSH_PORT" \
        -L"$LOCAL_PORT":dimlight.tk:"$SSH_PORT" dimlight.tk
    if [[ $? -eq 0 ]]; then
        echo Tunnel to HostA created successfully
    else
        echo An error occurred creating a tunnel to HostA. Return code: $?
    fi
}
/usr/bin/ssh -p "$LOCAL_PORT" "$USER"@localhost ls > /dev/null
if [[ $? -ne 0 ]]; then
    echo Creating new tunnel connection to HostA
    createTunnel
fi

