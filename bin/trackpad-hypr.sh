#!/bin/sh

HINT="syna3069:00-06cb:cd0a-touchpad"
DEVICE=$(echo $(hyprctl devices | grep $HINT | grep -Pzo "\s+[a-z\-/\d\.\:]+touchpad" | grep -Pzo "[a-z\-/\d\.\:]+"))

VARIABLE="device:$DEVICE:enabled"

#echo $DEVICE

if [ -n "$(hyprctl getoption $VARIABLE | grep 'int: 0')" ]; then
	# if the device is disabled, then enable
  	#notify-send -u normal "Enabling Touchpad"
	hyprctl keyword $VARIABLE true
else
	# if the device is enabled, then disable
	#notify-send -u normal "Disabling Touchpad"
	hyprctl keyword $VARIABLE false
fi
