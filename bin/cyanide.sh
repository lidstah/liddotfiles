#!/bin/bash
touch /tmp/cyanide
touch /tmp/cyanide.png
CYANIDE_URL="http://www.explosm.net/comics/new/"
wget -q -O "/tmp/cyanide" $CYANIDE_URL
# grep db\/files\Comics /tmp/cyanide # DEBUG
IMAGE_LOCATION=`grep db\/files\/Comics /tmp/cyanide | sed -n 's/\(.*\)\(http:\/\/.*png\)\(.*\)/\2/p'`
wget -q -O "/tmp/cyanide.png" $IMAGE_LOCATION
echo $IMAGE_LOCATION # DEBUG
feh /tmp/cyanide.png
