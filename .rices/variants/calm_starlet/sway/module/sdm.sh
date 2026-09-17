#!/bin/bash

chosen=$(echo -e "Shutdown\0icon\x1fsystem-shutdown\nReboot\0icon\x1fsystem-reboot\nSuspend\0icon\x1fsystem-suspend" | $1)

if [[ $chosen = "Shutdown" ]]; then
	systemctl poweroff -i
elif [[ $chosen = "Reboot" ]]; then
	systemctl reboot -i
elif [[ $chosen = "Suspend" ]]; then
	sleep 1 && systemctl suspend
fi

