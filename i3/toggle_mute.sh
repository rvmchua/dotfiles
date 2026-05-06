#!/bin/bash

pamixer -t

if pamixer --get-mute | grep -q "true"; then
  notify-send "Volume Muted"
else
  notify-send "Volume Unmuted"
fi
