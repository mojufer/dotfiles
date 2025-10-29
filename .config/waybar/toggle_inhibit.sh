#!/usr/bin/env bash

# State file
STATE_FILE="/tmp/waybar_inhibit_state"

# Check if inhibit is active
if [[ -f "$STATE_FILE" ]]; then
	# Disable inhibition
	pkill -f "swayidle.*inhibit"
	rm -f "$STATE_FILE"

else
	# Enable inhibition
	swayidle -w --inhibit > /dev/null 2>&1 &
	touch "$STATE_FILE"
fi

# Send signal to waybar to refresh the module
pkill -SIGRTMIN+10 waybar
