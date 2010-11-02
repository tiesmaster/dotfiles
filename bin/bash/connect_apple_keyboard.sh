#!/bin/bash

APPLE_KEYBOARD_ID="90:84:0D:FE:13:05"
TIMEOUT=10

while true
do
	connected=`hidd --show |grep $APPLE_KEYBOARD_ID |wc -l`
	if [ $connected == "1" ]
	then
		echo "INFO: Keyboard is connected, sleeping for $TIMEOUT seconds"
		sleep $TIMEOUT
	else
		echo "INFO: Keyboard is disconnected, trying to connect to device $APPLE_KEYBOARD_ID"
		hidd --connect $APPLE_KEYBOARD_ID
	fi
done
