#!/bin/bash
# Turn mic on/off or toggle it based on press delay
# Start -> On
# Press -> On
# Quick release -> Off
# Slow release -> Off

# Start with Off
# Press toggles it to On
# Quick release leaves it as On
# Slow release turns it back Off

timefile=/tmp/micled_timefile
delay=250
amixer_option="name='Capture Switch' -D pulse"

function toggleCapture {
    eval amixer cset $amixer_option toggle
}
function onCapture {
    eval amixer cset $amixer_option on
}
function offCapture {
    eval amixer cset $amixer_option off
}
function isOn {
    eval amixer cget $amixer_option | grep -qF 'values=on'
}

case $1 in
    press)
        # notify-send Mic Press
        # Check if its already on
        if ! isOn; then
            onCapture;
            date +%s%3N > $timefile
        fi
        ;;
    release)
        # If we release after cutoff, toggle again.
        if [[ -f $timefile ]]; then
            pressStart=$(cat $timefile)
            pressEnd=$(date +%s%3N)
            (( difference=pressEnd-pressStart ))
            echo Start $pressStart, End $pressEnd, diff: $difference
            # notify-send Mic "Release: Diff $difference"
            if [[ $difference -gt $delay ]]; then
                toggleCapture
            fi
        else
            offCapture
        fi
        rm $timefile ||:
        ;;
esac
