#!/usr/bin/env fish

# The icon that would change color
set icon "🔇"

if test (dunstctl is-paused) = "true"
    echo "%{F#FFFFFF}ON"
else
    echo "%{F#65737E}OFF"
end
