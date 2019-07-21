#!/bin/bash

STATE=$(bbq :state)
TITLE=$(echo $STATE | jq -r ".item.title")
ARTIST=$(echo $STATE | jq -r ".item.artist")

if [ $(echo $STATE | jq -r ".vars.repeat") == "true" ]; then
    REPCOLOR="F#FFFFFF"
else
    REPCOLOR="F#8A9899"
fi

echo "$TITLE - $ARTIST"
