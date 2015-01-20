#!/bin/bash

if [ $# -ne 1 ]; then
	echo Usage: $(basename $0) username
	exit 1
fi

curl --connect-timeout 3 -fsm 3 http://www.reddit.com/user/$1/about.json | 
awk '{match($0, "k_karma\": ([0-9]+)", a);
      match($0, "t_karma\": ([0-9]+)", b);
      print "L:", a[1], "C:", b[1];}'

#eof
