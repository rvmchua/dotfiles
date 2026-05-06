#!/bin/bash

INTERFACE="wlx1027f5451e72" # Your interface name

# 1. Get speed in Mbit/s (We know your vnstat returns this unit)
VNSTAT_OUTPUT=$(vnstat -i "$INTERFACE" -tr 2>/dev/null)
SPEED_Mbit=$(echo "$VNSTAT_OUTPUT" | grep 'rx' | awk '{print $2}')

# Check for missing values
if [ -z "$SPEED_Mbit" ] || [ "$SPEED_Mbit" == "0.00" ]; then
    echo "⬇️ 0.00 KB/s"
    exit 0
fi

# 2. Convert Mbit/s to MByte/s (Divide by 8)
# Use 'bc' for floating-point math and format to 2 decimal places
SPEED_MBPS=$(echo "scale=2; $SPEED_Mbit / 8" | bc)

# 3. Dynamic Unit Switching (KB/s or MB/s)
# Check if the speed is less than 1.00 MB/s
if [ $(echo "$SPEED_MBPS < 1.00" | bc) -eq 1 ]; then
    # If < 1 MB/s, convert to KB/s (multiply by 1024)
    SPEED_KBS=$(echo "scale=0; $SPEED_MBPS * 1024" | bc)
    echo "⬇️ $SPEED_KBS KB/s"
else
    # Otherwise, display in MB/s
    echo "⬇️ $SPEED_MBPS MB/s"
fi
