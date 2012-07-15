#!/bin/bash
touch /tmp/cyanide
touch /tmp/cyanide.png
CYANIDE_URL="http://www.explosm.net/comics/random"
wget -q -O "/tmp/cyanide" $CYANIDE_URL
IMAGE_LOCATION=`grep db\/files\/Comics /tmp/cyanide | sed -n 's/\(.*\)\(http:\/\/.*png\)\(.*\)/\2/p'`
wget -q -O "/tmp/cyanide.png" $IMAGE_LOCATION
feh /tmp/cyanide.png
