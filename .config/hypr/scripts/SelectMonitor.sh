#!/bin/bash

HYPR_CONFIG_DIR="$HOME/.config/hypr"
MONITOR_PROFILES_DIR="$HYPR_CONFIG_DIR/monitor-profiles"
SELECTED_MONITOR="$MONITOR_PROFILES_DIR/$1"

if [[ ! -e $SELECTED_MONITOR ]]; then
    echo "Could not find $SELECTED_MONITOR"
    exit -1
fi


cp $SELECTED_MONITOR $HYPR_CONFIG_DIR/monitors.conf

exec $HYPR_CONFIG_DIR/scripts/Refresh.sh

