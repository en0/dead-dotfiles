#!/usr/bin/env bash

GITSTATUS=$(git log --no-merges --pretty=format:'%an:%ae:%D:%s' -1)

FWIDTH=$(tput cols)
WIDTH=$[${FWIDTH} - 3]

function show() {
    STR=$(echo $1 | sed -e 's/^ //' -e 's/ $//')
    DIR=$2
    LIMIT=$3
    SSTR=$(echo ${STR} | ${DIR} -c ${LIMIT} | sed 's/ $//')

    if [ "$STR" != "$SSTR" ]; then
        echo "${SSTR}..."
    else
        echo "${STR}"
    fi
}

function showl() {
    show "${1}" "head" "${WIDTH}"
}

function showr() {
    show "${1}" "tail" "${WIDTH}"
}

function hr() {
    HRCHAR=$1
    HR=""
    HR_COUNTER=${FWIDTH}
    while [[ ${HR_COUNTER} -gt 0 ]]; do
        HR="${HR}${HRCHAR}"
        HR_COUNTER=$[$HR_COUNTER -1]
    done
    echo $HR
}

AUTHOR="$(echo $GITSTATUS | cut -d':' -f1) <$(echo $GITSTATUS | cut -d':' -f2)>"
REF="$(echo $GITSTATUS | cut -d':' -f3)"

showl "${GITSTATUS#*:*:*:}"
hr ─
showl "▶ By: ${AUTHOR}"
showl "▶ On: ${REF}"
hr ─

git status --short | while read -r line; do
    echo "• ${line% *} $(show "${line#* }" tail $[${FWIDTH} - 6])"
done
