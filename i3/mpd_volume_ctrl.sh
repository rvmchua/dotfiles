#!/bin/bash

ACTION="$1" # Expects 'up' or 'down'

# Full paths for external commands
MPC="/usr/bin/mpc" # Verify this path with 'which mpc'
NOTIFY_SEND="/usr/bin/notify-send" 

# Check if MPD is running
if ! $MPC status > /dev/null 2>&1; then
    $NOTIFY_SEND "MPD Error" "Music Player Daemon is not running."
    exit 1
fi

case "$ACTION" in
    up)
        # Increase volume by 5%
        $MPC volume +5
        ;;
    down)
        # Decrease volume by 5%
        $MPC volume -5
        ;;
    *)
        exit 1
        ;;
esac

# Get current volume for notification
CURRENT_VOLUME=$($MPC volume | awk '{print $NF}' | tr -d '%')

# Send notification
$NOTIFY_SEND "MPD Volume" "${CURRENT_VOLUME}%"
