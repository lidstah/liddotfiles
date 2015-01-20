#!/bin/bash

conky -c conkySTUMP | while read -r; do echo $REPLY > /mnt/ramdisk/stumpconk; done &
