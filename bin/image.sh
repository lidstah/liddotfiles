#/bin/bash

if [[ $# = 1 ]]; then
    #statements
    convert $1 -resize 40 txt:-|sed -E 's/://;s/\( ? ?//;s/, ? ?/,/g;s/\)//;s/([0-9]+,[0-9]+,[0-9]+),[0-9]+/\1/g;s/255/254/g;/mage/d'|awk '{print $1,$2}'|sed -E 's/^0,[0-9]+ /print "echo;tput setaf "\;/;s/^[0-9]+,[0-9]+ /print "tput setaf ";/;s/(.+),(.+),(.+)/\1\/42.5*36+\2\/42.5*6+\3\/42.5+16/'|bc|sed 's/$/;echo -n "  ";/'|tr '\n' ' '|sed 's/^/tput rev;/;s/; /;/g;s/$/tput sgr0;echo/'|bash
else
    echo "Usage: image.sh image.png"
fi

    
