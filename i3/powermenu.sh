#!/bin/bash

# Define the options for the menu
options="Shutdown\nReboot\nLogout\nSleep"

# Get the user's choice using rofi
chosen=$(echo -e "$options" | rofi -dmenu -p "Power Menu" -theme ~/.local/share/rofi/themes/bonito/style.rasi)

# Perform the action based on the choice
case "$chosen" in
    Shutdown) systemctl poweroff ;;
    Reboot) systemctl reboot ;;
    Logout) i3-msg exit ;;
    Sleep) systemctl suspend ;;
esac
