#!/usr/bin/bash

output=$(xrandr --query | grep " connected" | awk '{print $1}' | dmenu -i)
if [ -z "$file"]; then
    exit 0
fi

if xrandr --query | grep "$output" | grep "[0-9]x[0-9]"; then
    xrandr --output "$output" --off
else
    xrandr --output "$output" --auto
fi
