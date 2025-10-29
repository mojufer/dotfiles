#!/usr/bin/env bash

# State file
STATE_FILE="/tmp/waybar_inhibit_state"

# Check if inhibit is active
if [[ -f "$STATE_FILE" ]]; then
	# Disable inhibition
	swaymsg "inhibit_idle off"
	rm -f "$STATE_FILE"

else
	# Enable inhibition
	swaymsg "inhibit_idle on"
	touch "$STATE_FILE"
file

# Send signal to waybar to refresh the module
pkill -SIGRTMIN+10 waybar
