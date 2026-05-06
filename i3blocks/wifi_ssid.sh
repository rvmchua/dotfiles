#!/bin/bash

# Check for the active Wi-Fi connection and get the connection name
# We use allowed fields: TYPE, STATE, and CONNECTION
ssid=$(nmcli -t -f TYPE,STATE,CONNECTION device | grep 'wifi' | grep 'connected' | awk -F: '{print $3}')

# If the ssid variable is not empty, a connection exists.
if [ -n "$ssid" ]; then
  echo " $ssid"
else
  echo " OFF"
fi