#!/bin/bash
# petit script à la con pour recup le bonjourmadame du jour :)
MADAME_URL="http://www.bonjourmadame.fr"

# On recupère le source de la page
wget -q -O "/tmp/bonjourmadame" $MADAME_URL

# on extrait l'adresse de l'image qui nous intéresse
IMAGE_LOCATION=`grep media.tumblr.com /tmp/bonjourmadame | sed -n 's/\(.*\)\(http:\/\/.*jpg\)\(.*\)/\2/p'`

# echo $IMAGE_LOCATION

# on pompe et on affiche :)
wget -q -O "/tmp/madame.jpg" $IMAGE_LOCATION
feh /tmp/madame.jpg
