#!/usr/bin/env bash

entries="Logout\nSuspend\nReboot\nShutdown"
selected=$(\
  printf '%b' "${entries}"\
  | rofi -dmenu -i\
  | awk '{print tolower($1)}'\
)

case $selected in
  logout)
    hyprctl dispatch exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
