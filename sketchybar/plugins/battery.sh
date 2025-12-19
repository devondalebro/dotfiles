#!/bin/bash

PERCENTAGE=$(pmset -g batt | grep -o "[0-9]*%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ -z "$PERCENTAGE" ]; then
  exit 0
fi

if [[ $CHARGING != "" ]]; then
  ICON=""
else
  case ${PERCENTAGE} in
    9[0-9]|100) ICON="";;
    [6-8][0-9]) ICON="";;
    [3-5][0-9]) ICON="";;
    [1-2][0-9]) ICON="";;
    *) ICON=""
  esac
fi

sketchybar --set $NAME icon="$ICON" label="${PERCENTAGE}%"
