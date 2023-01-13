#!/usr/bin/env bash

dir="$HOME/.config/polybar"

# Terminate already running bar instances
killall -9 -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
 PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1) 
 for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
# Launch the bar
   if [[ "$monitor" == "$PRIMARY" ]]; then
     MONITOR="$monitor" polybar -q primary -c "$dir/config.ini" &
   else
     MONITOR="$monitor" polybar -q main -c "$dir/config.ini" &
 	fi
done

