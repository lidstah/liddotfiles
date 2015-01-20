#!/bin/bash
# weather script - to use with ratpoison/dzen, stumpwm modeline, wmii, or wmfs statusbar.
# sleeps 30 minutes, then update file /tmp/weather.txt with data from http://weather.noaa.gov.
# LFRS is for Nantes, France - check the url below to find your city.

touch /tmp/wget_LFRS.txt
METEO_URL="http://weather.noaa.gov/pub/data/observations/metar/decoded/LFRS.TXT"

while true;
do
	wget -q -O "/tmp/wget_LFRS.txt" $METEO_URL
	TEMP=`grep Temperature /tmp/wget_LFRS.txt | cut -d " " -f 4 | sed s/\(//`
	HUMIDITY=`grep Humidity /tmp/wget_LFRS.txt | cut -d " " -f 3`
	CONDITION=`grep Sky /tmp/wget_LFRS.txt | cut -d " " --fields=3,4`
	echo "T°:" $TEMP"°C Hum:" $HUMIDITY $CONDITION > /tmp/weather.txt
	# if you need an iso output (wmii 3.6, stump modeline) use this file instead
	iconv -f utf-8 -t iso-8859-15 /tmp/weather.txt > /tmp/weatheriso.txt
	sleep 30m
done
