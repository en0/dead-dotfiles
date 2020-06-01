#!/usr/bin/env bash

SETTINGS=$HOME/.config/alacritty/alacritty.yml
LINE=$(grep "^font:" -n -A1 $SETTINGS | grep size | awk '{print $1 $3}')
LINE_NUM=${LINE%-*}
VAL=${LINE#*-}
NVAL=$[$VAL $1 2]
sed -i "${LINE_NUM}s/${VAL}/${NVAL}/" $SETTINGS
