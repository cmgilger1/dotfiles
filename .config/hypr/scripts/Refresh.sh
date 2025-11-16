#!/bin/bash

# some process to kill
for pid in $(pidof waybar wofi ags); do
    kill "$pid"
done

#Restart waybar
sleep 1
waybar &
