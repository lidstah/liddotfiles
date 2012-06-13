#!/bin/bash
touch /tmp/xkcd
touch /tmp/xkcd.png
XKCD_URL="http://www.xkcd.com"
wget -q -O "/tmp/xkcd" $XKCD_URL
IMAGE_LOCATION=`sed -n 51p /tmp/xkcd | cut -d '"' -f 2`
wget -q -O "/tmp/xkcd.png" $IMAGE_LOCATION
feh /tmp/xkcd.png
