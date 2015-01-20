#!/bin/bash

scrot /tmp/i3shot.png
convert /tmp/i3shot.png -blur 0x5 /tmp/i3.png
i3lock -i /tmp/i3.png
