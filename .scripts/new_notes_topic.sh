#!/bin/bash

page=$(echo "" | rofi -dmenu -p "Zettelkasten Page:")

if [ -n "$page" ]; then
    brave --app="https://pkm.brushtail.me/$page"
fi
