#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have benn shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g')
polybar example &

echo "Polybar launched..."
