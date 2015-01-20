#!/bin/bash

#Variables

CPU0=`cat /proc/stat | grep cpu0 | awk '{print $5}'`
CPU1=`cat /proc/stat | grep cpu1 | awk '{print $5}'`
TOTAL_CPU=61470803
RATIO=$(echo "$CPU0/$TOTAL_CPU"|bc -l)
USED_CPU=$(echo "(1.0-$RATIO)*100"|bc)
CPU_VALUE=`echo ${USED_CPU:0:5}`
echo $CPU_VALUE

