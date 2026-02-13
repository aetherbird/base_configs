#!/bin/bash
pkill -u "$USER" -x pipewire
pkill -u "$USER" -x wireplumber
pkill -u "$USER" -x pipewire-pulse

/usr/bin/pipewire &
sleep 1
/usr/bin/wireplumber &
sleep 1
/usr/bin/pipewire-pulse &
