#!/usr/bin/env bash

CMD=playerctl


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
    chosen=$(printf "%s\n" "${!opts[@]}" | dmenu)
    if [ $? = 0 ]
    then
        ${opts[$chosen]}
    fi
}

which $CMD > /dev/null && doit && exit
i3-nagbar -m "You must install $CMD."
exit 1
