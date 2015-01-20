#!/bin/bash

function statusbar() {
    ws_list="$(wingo-cmd GetWorkspaceList)"
    ws_active="$(wingo-cmd GetWorkspace)"
    conkz="$(cat /mnt/ramdisk/conkytext)"

    for ws in $ws_list; do
        if [ "$ws" == "$ws_active" ]
        then
            ws_all+="^fg(#e3e0d7)[$ws]^fg(#506070) "
        else
            ws_all+="$ws "
        fi
    done
    echo ".:[^fg(#506070) $ws_all^fg()] :: $conkz:." > /mnt/ramdisk/wingotext
    unset ws_all
}

while true; do
    statusbar
    sleep 3
done
