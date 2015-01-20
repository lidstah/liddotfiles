#!/bin/bash
CYANIDE_URL="http://www.explosm.net/comics/new/"
while [[ true ]]; do
    wget -q -O "/tmp/cyanide" $CYANIDE_URL
    #grep db\/files\Comics /tmp/cyanide
    # on extrait l'adresse exacte de l'image qui nous intéresse (ie, celle d'aujd)
    IMAGE_LOCATION=`grep db\/files\/Comics /tmp/cyanide | sed -n 's/\(.*\)\(http:\/\/.*png\)\(.*\)/\2/p'`
    wget -q -O "/tmp/cyanide.png" $IMAGE_LOCATION
    # on update toutes les six heures
    sleep 360m
done
