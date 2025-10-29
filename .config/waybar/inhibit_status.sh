#!/usr/bin/env bash

STATE_FILE="/tmp/waybar_inhibit_state"

if [[ -f "$STATE_FILE" ]]; then
    # Active (don’t suspend)
    echo '{"text": "", "class": "active", "tooltip": "Idle inhibition active (won’t suspend)"}'
else
    # Inactive (normal behavior)
    echo '{"text": "", "class": "inactive", "tooltip": "Normal idle/suspend enabled"}'
fi
