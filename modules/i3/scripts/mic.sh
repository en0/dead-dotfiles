#/bin/bash

if [ ! -z "$1" ]
then
    pactl get-default-source | xargs -I{} pactl set-source-mute {} "$1"
fi

MUTED="$(pactl get-default-source | xargs pactl get-source-mute)"

if [ "$MUTED" = "Mute: yes" ]
then
    echo '%{F#EF2F27}%{F-}'
else
    echo ''
fi
