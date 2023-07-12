#!/usr/bin/bash
### xrandr_configure ###
### Ryan Gilluley ###

function odin5 () {
    xrandr \
        --output DP-0 \
        --mode 2560x1440 \
        --rate 240 \
        --primary &&
    xrandr \
        --output DP-2 \
        --mode 1920x1080 \
        --rate 240 \
        --right-of DP-0 
}

function menu () {
    echo 'Please select an preset...
1. ODIN5'

    read option
    echo $option
}

menu
