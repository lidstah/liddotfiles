#!/bin/bash

while true; do cat /mnt/ramdisk/conkytext; sleep 2; done | dzen2 -dock -ta c -bg "#1c1c1c" -fg "#e3e0d7" -h 13 -x 0 -y 14 -w 1920 -fn '-xos4-terminus-medium-r-normal-*-12-*-*-*-*-*-iso8859-15'
