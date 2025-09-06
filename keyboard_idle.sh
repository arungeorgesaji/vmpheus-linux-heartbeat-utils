#!/bin/bash

IDLE_LIMIT=600 

last_time=$(date +%s)

xev -root | grep --line-buffered "KeyPress" | while read line; do
    last_time=$(date +%s)
done &

xev_pid=$!

while true; do
    now=$(date +%s)
    idle=$((now - last_time))
    if [ "$idle" -ge "$IDLE_LIMIT" ]; then
        echo "Keyboard idle for $idle seconds."
    fi
    sleep 10 
done
