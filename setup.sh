#!/bin/sh
echo in-container setup starting
apk update
apk add expat
apk add python3
pip3 install protobuf websocket-client
chmod 755 /etc/init.d/cointhink-script 
rc-update add cointhink-script default
rc-status 

