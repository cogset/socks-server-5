#!/bin/bash

if [ -n "$SS_USER" -a -n "$SS_PASS" ]
then
    echo "$SS_USER $SS_PASS" > /etc/opt/ss5/ss5.passwd
fi

ss5 -t -u ss5

trap "kill `cat /var/run/ss5/ss5.pid`; exit" KILL INT

"$@"

wait
