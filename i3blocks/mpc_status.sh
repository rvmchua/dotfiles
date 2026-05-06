#!/bin/bash

# Get the current song info. This will be empty if nothing is playing/stopped.
SONG_INFO=$(mpc current)

# If a song title was returned:
if [ -n "$SONG_INFO" ]; then
    # Use grep to quickly check if the status line contains "playing"
    if mpc status | grep -q "playing"; then
        echo "🎶 $SONG_INFO"
    else
        # If the song title is there but the status isn't "playing," it's paused.
        echo "🎶 Paused: $SONG_INFO"
    fi
else
    # Output nothing if no song is loaded or MPD is off
    echo ""
fi
