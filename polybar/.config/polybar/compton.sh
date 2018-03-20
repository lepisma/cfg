#!/bin/sh

# The icon that would change color
icon=""

if pgrep -x "compton" > /dev/null
then
    echo "%{F#FFFFFF}$icon"
else
    echo "%{F#8A9899}$icon"
fi
