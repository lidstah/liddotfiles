#!/bin/bash


while true;
do
	RX_FILE=`cat /sys/class/net/eth0/statistics/rx_bytes`
	RX_ACTUAL=$(echo "$RX_FILE/1024"|bc -l)
	RX_SPEED=$(echo "$RX_ACTUAL-$RX_PAST"|bc -l)
	echo $RX_SPEED
	RX_PAST=$RX_ACTUAL
	sleep 1
done

