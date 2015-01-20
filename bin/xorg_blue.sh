#!/bin/sh

BLUE=0.5
BRIGHTNESS=0.7
OUTPUTS=$(xrandr | sed -n 's/^\([^ ]*\).*\<connected\>.*/\1/p')

adjust_output() 
{
    blue=$1
    brightness=$2
    shift 2

    for out in $*
    do
        xrandr --output $out --gamma 1:1:$blue --brightness $brightness
    done
}

case $1 in
    off)
        adjust_output 1 1.0 $OUTPUTS
        ;;
    *)
        adjust_output $BLUE $BRIGHTNESS $OUTPUTS
        ;;
esac
