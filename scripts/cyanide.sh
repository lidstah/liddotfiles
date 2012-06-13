#!/bin/bash
touch /tmp/cyanide
touch /tmp/cyanide.png
CYANIDE_URL="http://www.explosm.net/comics/new"
wget -q -O "/tmp/cyanide" $CYANIDE_URL
IMAGE_LOCATION=`sed -n 57p /tmp/cyanide | cut -d '"' -f 50`
wget -q -O "/tmp/cyanide.png" $IMAGE_LOCATION
feh /tmp/cyanide.png
