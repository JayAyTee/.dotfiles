#!/bin/bash

PID=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .pid')

if [ -n $PID ]
then
	echo $PID

	exit 0
fi

exit 1

