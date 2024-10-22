#!/usr/bin/bash

# Terminate already running bar instances
killall -q polybar

if type "xrandr"; then

  # Load polybar on all monitors
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example & # Load example bar, change example to the name of your bar or add any other bar after '&'
  done
else
  polybar --reload example &
fi
