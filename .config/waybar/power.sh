#!/bin/sh

# Get power in microwatts (adjust path)
power=$(cat /sys/class/power_supply/BAT0/power_now)

# Convert to watts and print with 1 decimal
printf "%.1f\n" "$(echo "$power / 1000000" | bc -l)"
