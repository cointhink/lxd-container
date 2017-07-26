#!/bin/sh
echo in-container setup starting
while [ -z "`ifconfig eth0 |grep inet`" ] ; do echo waiting for eth0; sleep 1;done
apk update
apk add expat
apk add python3
pip3 install protobuf websocket-client
chmod 755 /etc/init.d/cointhink-script
rc-update add cointhink-script default
rc-status
rc-status -c
rm /setup.sh
