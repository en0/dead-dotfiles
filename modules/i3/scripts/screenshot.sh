#!/usr/bin/env bash

CMD=maim

function doit() {
    SHOTDIR=$HOME/Pictures/screenshots
    SHOT=$SHOTDIR/$(date "+%y%m%d%s").png
    mkdir -p $SHOTDIR
    $CMD -s > $SHOT
    which xclip > /dev/null && \
        xclip -selection clipboard -t image/png -i $SHOT
}

which $CMD > /dev/null && doit && exit
i3-nagbar -m "You must install $CMD."
exit 1
