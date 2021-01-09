#!/bin/bash

function checkLed {
    if amixer -D pulse get Capture | grep -F '[on]'; then
        notify-send Mic On
        xset led 3
    else
        notify-send Mic Off
        xset -led 3
    fi
}

checkLed;
pactl subscribe | grep --line-buffered "Event 'change' on source" | (
    while read -r LINE; do
        checkLed;
    done
)

