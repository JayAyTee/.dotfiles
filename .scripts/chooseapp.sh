#!/bin/bash

apps_dir=~/.scripts/main_apps/

apps=$(ls $apps_dir)

selected_app=$(echo "$apps" | rofi -dmenu -i )

if [ -n "$selected_app" ]; then
  "${apps_dir}${selected_app}"
fi
