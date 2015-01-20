#!/bin/bash
# weather script - to use with ratpoison/dzen or wmfs statusbar.
# sleeps 30 minutes, then update file /tmp/weather.txt with data from http://weather.noaa.gov.

# LFRS is for Nantes, France - check the site below to find your city.
touch /tmp/wget_LFRS.txt
METEO_URL="http://weather.noaa.gov/pub/data/observations/metar/decoded/LFRS.TXT"
while true;
do
	wget -q -O "/tmp/wget_LFRS.txt" $METEO_URL
	LOCATION=`cat /tmp/wget_LFRS.txt | head -n 1 | awk '{print $1 $2}'`
	TEMP=`grep Temperature /tmp/wget_LFRS.txt | awk '{print $4}' | sed s/.//`
	HUMIDITY=`grep Humidity /tmp/wget_LFRS.txt | awk '{print $3}'`
	echo "Location: "$LOCATION" Temp:" $TEMP"°C Hum:" $HUMIDITY > /tmp/weather.txt
	iconv -f utf-8 -t iso-8859-15 /tmp/weather.txt > /tmp/weatheriso.txt
	sleep 30m
done
