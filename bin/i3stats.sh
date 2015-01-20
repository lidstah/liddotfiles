#!/bin/bash

conky | while read -r; do echo $REPLY; done &
