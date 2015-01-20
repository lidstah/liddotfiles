#!/bin/bash

while true
do
	DATE=`date -R`
	METEO=`cat /tmp/weatheriso.txt`
	MAIL=`ls -l ~/Mail/mbox/new | grep kadath | wc -l`
	VOL=`aumix -q | grep vol | awk '{ print $3 }'`
	MPD=`mpc | head -1`
	LOAD=`uptime | sed 's/.*,//'`

	wmiremote -t "[ Meteo: $METEO | Inbox: $MAIL | Vol: $VOL% | MPD: $MPD | Load: $LOAD | $DATE ]"
	sleep 5
done
