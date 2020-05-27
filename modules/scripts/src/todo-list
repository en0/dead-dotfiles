#!/usr/bin/env bash

if [ -z "$1" ]; then
    p=$PWD
else
    p=$1
fi

FWIDTH=$(tput cols)

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

echo "To Do List"

FN=''
grep -Rn TODO $p/* | sort | while read -r line; do

    ffn=$(echo $line | cut -d':' -f1)
    fln=$(echo $line | cut -d':' -f2)

    if [ "${ffn}" != "${FN}" ]; then
        FN=$ffn
        hr ─
        show $FN head $[${FWIDTH} - 3]
    fi

    ffv=${line#*:*:*:}
    echo ▶ $(show "${ffv}" head $[${FWIDTH} - 10]):${fln}
done
hr ─
