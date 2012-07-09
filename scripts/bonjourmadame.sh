#!/bin/bash
# petit script à la con pour recup le bonjourmadame du jour :)
touch /tmp/bonjourmadame
touch /tmp/madame.png
MADAME_URL="http://www.bonjourmadame.fr"

# On recupère le source de la page
wget -q -O "/tmp/bonjourmadame" $MADAME_URL

# on extrait l'adresse de l'image qui nous intéresse
IMAGE_LOCATION=`grep media.tumblr.com /tmp/bonjourmadame | sed -n 3p | cut -d '"' -f 2`
#echo $IMAGE_LOCATION

# on pompe et on affiche :)
wget -q -O "/tmp/madame.png" $IMAGE_LOCATION
feh /tmp/madame.png
