#!/usr/bin/env bash

WHITE='#918175'
BLACK='#1C1B19'
XGREY3='#3A3A3A'
ORANGE='#D75F00'
YELLOW='#FBB829'
XFONT='-*-dejavu sans mono-medium-r-normal--13-80-*-*-*-*-iso10646-1'
DMENU="dmenu -nf $WHITE -nb $BLACK -sb $XGREY3 -sf $YELLOW -p Context"
export KUBECTX_IGNORE_FZF=true

CTX=$(kubens | $DMENU -fn "${XFONT}")
[ $? = 0 ] && kubens $CTX
