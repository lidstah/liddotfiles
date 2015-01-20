#!/bin/bash
XKCD_URL="http://www.xkcd.com"
wget -q -O "/tmp/xkcd" $XKCD_URL
IMAGE_LOCATION=`grep Image /tmp/xkcd | cut -d " " -f 5`
wget -q -O "/tmp/xkcd.png" $IMAGE_LOCATION
feh /tmp/xkcd.png
