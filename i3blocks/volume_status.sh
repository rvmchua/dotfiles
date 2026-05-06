#!/bin/bash

# --- Use static ID 53 (as dynamic parsing is blocked) ---
SINK_ID=$(/usr/bin/wpctl status | grep 'Sinks:' -A 10 | grep '\*' | awk '{print $3}' | tr -cd '0-9' | head -n 1 | cut -c 1-2)
# --- End static ID ---

# Extract percentage and mute status
VOLUME_INFO=$(/usr/bin/wpctl get-volume $SINK_ID) # Use full path for wpctl here too
VOLUME_PERCENT=$(echo "$VOLUME_INFO" | awk '{print int($2 * 100 + 0.5)}')
MUTE_STATUS=$(echo "$VOLUME_INFO" | grep -oP '\[MUTED\]' | wc -l)

# Output for i3blocks (Simplified)
if [ "$MUTE_STATUS" -eq 1 ]; then
    # Muted: Use simple text and red color
    echo " MUTED"
    echo "#FF0000"
elif [ "$VOLUME_PERCENT" -eq 0 ]; then
    # Volume is 0% (unmuted): Use a colon and no percent sign for guaranteed rendering
    echo " 0" 
    echo "#808080"
else
    # Unmuted and volume > 0: Use a colon for separation
    echo " ${VOLUME_PERCENT}%"
    echo "#FFFFFF" 
fi
