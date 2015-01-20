#!/bin/bash

DATE=`date`
WEAT=`cat /tmp/weather.txt`
KARMA=`cat /home/lidstah/karma.txt`
CPU=`cat /mnt/ramdisk/stumpconk`
echo "^1*"$KARMA "^n::^2*" $WEAT "^n::^3*" $CPU "::" $DATE "^n:."
