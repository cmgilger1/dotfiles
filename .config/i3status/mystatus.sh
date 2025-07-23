#!/bin/bash

i3status --config ~/.config/i3status/config | while :
do
  read line
  # Parse the X window id, the process id, and the process name
  window_id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
  pid=$(xprop -id $window_id | grep _NET_WM_PID | awk 'NF>1{print $NF}')
  process_name=$(ps -p $pid | grep $pid | awk 'NF>1{print $NF}')

  # Checks if the process is firefox, and if so then provides a title,
  # otherwise it goes with the more general method. This is also easily
  # extensible for more edge cases, btw, you just have to add more
  # if-else statements before the 'general' case. Added elif.
  if [ $process_name == "firefox" ]
  then
    name="Firefox"
  elif [ $process_name == "chrome" ]
  then
    name="Chrome"
  elif [ $process_name == "nvim" ]
  then
      name="nvim"
  else
    name=$(xprop -id $window_id | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
  fi

  echo "$name | $line" || exit 1
done
