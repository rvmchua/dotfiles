#!/bin/bash
ACTION="$1" 

SINK_ID=$(/usr/bin/wpctl status | grep 'Sinks:' -A 10 | grep '\*' | awk '{print $3}' | tr -cd '0-9' | head -n 1 | cut -c 1-2)

# Full path to notify-send (Replace with your actual path if different)
NOTIFY_SEND="/usr/bin/notify-send" 
# Full path to wpctl (Replace with your actual path if different)
WPCTL="/usr/bin/wpctl" 
# Full path to pkill (Replace with your actual path if different)
PKILL="/usr/bin/pkill" 


if [ -z "$SINK_ID" ]; then
    $NOTIFY_SEND "Volume Error" "Sink ID is missing."
    exit 1
fi

# Execute the action and send notification
case "$ACTION" in
    up)
        # Increase volume
        $WPCTL set-volume -l 1.5 $SINK_ID 5%+
        VOLUME_PERCENT=$($WPCTL get-volume $SINK_ID | awk '{print int($2 * 100 + 0.5)}')
        $NOTIFY_SEND "Volume: ${VOLUME_PERCENT}%"
        ;;
    down)
        # Decrease volume
        $WPCTL set-volume $SINK_ID 5%-
        VOLUME_PERCENT=$($WPCTL get-volume $SINK_ID | awk '{print int($2 * 100 + 0.5)}')
        $NOTIFY_SEND "Volume: ${VOLUME_PERCENT}%"
        ;;
    mute)
        # Toggle mute status
        $WPCTL set-mute $SINK_ID toggle
        MUTE_STATUS=$($WPCTL get-volume $SINK_ID | grep -oP '\[MUTED\]')
        if [ -n "$MUTE_STATUS" ]; then
            $NOTIFY_SEND "Mute: 🔇"
        else
            $NOTIFY_SEND "Mute: 🔊"
        fi
        ;;
esac

# Send signal to i3blocks to refresh the volume display
/usr/bin/pkill -RTMIN+10 i3blocks
