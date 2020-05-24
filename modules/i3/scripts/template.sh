#!/usr/bin/env bash

CMD=foo

function doit() {
    echo did it
}

which $CMD > /dev/null && doit && exit
i3-nagbar -m "You must install $CMD."
exit 1
