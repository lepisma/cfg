#!/bin/sh

# The command for starting compton
# always keep the -b argument!
COMPTON="compton -b"

if pgrep -x "compton" > /dev/null
then
    killall compton
else
    $COMPTON
fi
