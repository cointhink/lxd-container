#!/bin/sh
echo in-container setup starting
while [ -z "`ifconfig eth0 |grep inet\ addr`" ] ; do echo waiting for eth0; sleep 1;done
apk update
apk add expat
apk add python3
apk add py3-numpy
pip3 install protobuf websocket-client
cp /cointhink/websocket-0.44.0-noerr-_app.py /usr/lib/python3.6/site-packages/websocket/_app.py || echo '!!! websocket patch FAILED'
chmod 755 /etc/init.d/cointhink-script
rc-update add cointhink-script default
rc-status
rc-status -c
rm /setup.sh
