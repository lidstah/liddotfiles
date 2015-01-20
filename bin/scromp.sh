#!/bin/bash
# script de screenshot + upload direct sur omploader.

# variables

FICHIER=/tmp/lidshot.png

# screenshot et envoi à omploader
echo "taking screenshot"
scrot -d 5 -c /tmp/lidshot.png
echo "uploading screenshot to OMP"
ompluad $FICHIER
