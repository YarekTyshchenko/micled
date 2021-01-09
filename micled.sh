#!/bin/bash

led=0
while true; do
    if amixer -D pulse get Capture | grep -qF '[on]'; then
        if [[ "x$led" == "x0" ]]; then
            led=1
            xset led 3
        fi
    else
        if [[ "x$led" == "x1" ]]; then
            led=0
            xset -led 3
        fi
    fi
    sleep 1;
done

