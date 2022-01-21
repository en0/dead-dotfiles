#!/usr/bin/env bash

for opt in $@
do
    [[ "primary" == "$opt" ]] && PRIMARY="yes"
    [[ "secondary" == "$opt" ]] && SECONDARY="yes"
    [[ "tertiary" == "$opt" ]] && TERTIARY="yes"
done

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

[ ! -z "$PRIMARY" ] && polybar primary -r &
[ ! -z "$SECONDARY" ] && polybar secondary -r &
[ ! -z "$TERTIARY" ] && polybar tertiary -r &
