#!/usr/bin/env bash

#chmod +x ~/yopy/.config/polybar/launch.sh 2>/dev/null || chmod +x ~/.config/polybar/launch.sh

# Terminate already running processes polybar
killall -q polybar

# Waiting for processes to be deleted
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar top &

