#!/usr/bin/env bash

WHITE='#918175'
BLACK='#1C1B19'
XGREY3='#3A3A3A'
ORANGE='#D75F00'
YELLOW='#FBB829'
XFONT='-*-dejavu sans mono-medium-r-normal--13-80-*-*-*-*-iso10646-1'
DMENU="dmenu -nf $WHITE -nb $BLACK -sb $XGREY3 -sf $YELLOW -p Malstr"

do-uuid() {
    python -c 'import uuid; print(uuid.uuid4())' | \
        sed s/\n// | \
        xsel -ib
}

do-b64-encode() {
    xsel -ob | \
        base64 | \
        sed s/\n// | \
        xsel -ib
}

do-b64-decode() {
    xsel -ob | \
        base64 -D | \
        sed s/\n// | \
        xsel -ib
}

do-json-pp() {
    xsel -ob | \
        python -m json.tool | \
        xsel -ib
}


declare -A SCRIPTS
SCRIPTS+=(
[uuid]="do-uuid"
[b64-encode]="do-b64-encode"
[b64-decode]="do-b64-decode"
[json-pp]="do-json-pp"
)

choice=$(printf "%s\n" "${!SCRIPTS[@]}" | $DMENU -fn "${XFONT}")

[ $? = 0 ] && ${SCRIPTS[$choice]}

