#!/bin/sh

# The icon that would change color
icon=""

if pgrep -x "picom" > /dev/null
then
    echo "%{F#FFFFFF}$icon"
else
    echo "%{F#65737E}$icon"
fi
