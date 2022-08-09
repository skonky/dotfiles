#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

dir="$HOME/.config/polybar"

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

polybar top -c "$dir/config.ini" 2>&1 | tee -a /tmp/polybar1.log & disown

polybar top_external -c "$dir/config.ini" 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
