#!/bin/bash

conky -c /home/lidstah/conky_STUMP | while read -r; do echo $REPLY > /mnt/ramdisk/conkytext; done &
