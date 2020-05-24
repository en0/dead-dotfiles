#!/usr/bin/env bash

WHITE='#918175'
BLACK='#1C1B19'
XGREY3='#3A3A3A'
ORANGE='#D75F00'
XFONT='-*-dejavu sans mono-medium-r-normal--13-80-*-*-*-*-iso10646-1'

CMD=playerctl
DMENU="dmenu -nf $WHITE -nb $BLACK -sb $XGREY3 -sf $ORANGE -p Spotify"

function run-spotify() {
    ps aux | grep -v grep  | grep spotify > /dev/null
    if [ $? = 0 ]
    then
        i3-msg workspace 0 
    else
        exec spotify
    fi
}

function doit() {

    declare -A opts=(
     [play]="$CMD play"
     [stop]="$CMD stop"
     [toggle]="$CMD play-pause"
     [next]="$CMD next"
     [prev]="$CMD previous"
     [run]="run-spotify"
    )
    chosen=$(printf "%s\n" "${!opts[@]}" | $DMENU -fn "$XFONT")
    if [ $? = 0 ]
    then
        ${opts[$chosen]}
    fi
}

which $CMD > /dev/null && doit && exit
i3-nagbar -m "You must install $CMD."
exit 1
