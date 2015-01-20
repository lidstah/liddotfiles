#!/bin/bash

conky -c ratconk | while read -r; do echo $REPLY > /mnt/ramdisk/conkytext; done &
