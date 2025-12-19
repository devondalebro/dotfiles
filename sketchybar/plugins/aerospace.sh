#!/bin/bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on \
                           background.color=0xfff38ba8 \
                           label.color=0xff11111b \
                           icon.color=0xff11111b
else
    sketchybar --set $NAME background.drawing=off \
                           label.color=0xffcdd6f4 \
                           icon.color=0xffcdd6f4
fi
