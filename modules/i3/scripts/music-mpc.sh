#!/usr/bin/env bash

WHITE='#918175'
BLACK='#1C1B19'
XGREY3='#3A3A3A'
ORANGE='#D75F00'
YELLOW='#FBB829'
XFONT='-*-dejavu sans mono-medium-r-normal--13-80-*-*-*-*-iso10646-1'

CMD=mpc
CMD_FLAGS="--host=192.168.50.10"
DMENU="dmenu -nf $WHITE -nb $BLACK -sb $XGREY3 -sf $YELLOW -p Media"

function run-ncmpcpp() {
    ps aux | grep -v grep  | grep ncmpcpp > /dev/null
    if [ $? = 0 ]
    then
        i3-msg workspace 0 
    else
        exec alacritty -e ncmpcpp $CMD_FLAGS
    fi
}

function doit-mpd() {

    declare -A opts=(
     [play]="$CMD $CMD_FLAGS play"
     [stop]="$CMD $CMD_FLAGS stop"
     [toggle]="$CMD $CMD_FLAGS toggle"
     [next]="$CMD $CMD_FLAGS next"
     [prev]="$CMD $CMD_FLAGS prev"
     [run]="run-ncmpcpp"
    )
    chosen=$(printf "%s\n" "${!opts[@]}" | $DMENU -fn "$XFONT")
    if [ $? = 0 ]
    then
        ${opts[$chosen]}
    fi
}

which $CMD > /dev/null && doit-mpd && exit
i3-nagbar -m "You must install $CMD."
exit 1
