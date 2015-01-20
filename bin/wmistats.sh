#!/bin/bash

conky | while read -r; do echo -n "$REPLY"; done &
