#!/bin/bash
touch /tmp/apod
touch /tmp/apod.jpg
APOD_URL="http://apod.nasa.gov/apod/astropix.html"
wget -q -O "/tmp/apod" $APOD_URL
IMAGE_LOCATION=`sed -n 30p /tmp/apod | cut -d '"' -f 2`
wget -q -O "/tmp/apod.jpg" http://apod.nasa.gov/apod/$IMAGE_LOCATION
feh /tmp/apod.jpg
