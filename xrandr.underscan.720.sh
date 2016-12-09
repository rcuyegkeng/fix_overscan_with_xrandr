#!/bin/bash

# `xrandr --properties` lists properties of the monitor.
# My monitor has 'underscan hborder', 'underscan vborder', and 'underscan'
# properties.

# This script sets the underscan properties for 1280x720.
EXTERNAL_OUTPUT="HDMI-0"
EXTERNAL_RESOLUTION="1280x720"

#echo "Check if $EXTERNAL_OUTPUT connected."
xrandr | grep $EXTERNAL_OUTPUT | grep " connected " #| grep $EXTERNAL_RESOLUTION
if [ $? -eq 0 ]; then
#	echo "Setting Display Properties with xrandr."
	xrandr --output "HDMI-0" --mode "$EXTERNAL_RESOLUTION" --set "underscan hborder" "35" --set "underscan vborder" "23" --set "underscan" "on"
fi

