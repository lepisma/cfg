#!/bin/sh

PICOM="picom -b --experimental-backends"

if pgrep -x "picom" > /dev/null
then
    killall picom
else
    $PICOM
fi
