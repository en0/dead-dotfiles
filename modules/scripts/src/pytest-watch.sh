#!/usr/bin/env bash

EXCLUDE=".*\/__pycache__\/.*"
INCLUDE="src/* tests/*"
DEBUG=false

[ ! -z "$PYTEST_WATCH_EXCLUDE" ] && EXCLUDE=$PYTEST_WATCH_EXCLUDE
[ ! -z "$PYTEST_WATCH_INCLUDE" ] && INCLUDE=$PYTEST_WATCH_INCLUDE


function show_usage {
    echo "Usage: $(basename $0) [OPTIONS] -- [Pytest Arguments]"
    echo ""
    echo "OPTIONS:"
    echo ' -h        Display this help message.'
    echo ' -p PATHS  Set the PYTHONPATH variable. Default: "src:tests"'
    echo ' -e EXCLD  Set the watch exclude regex pattern. Default: ".*\/__pycache__\/.*"'
    echo ' -i INCLD  Set the watch include glob pattern. Default: "src/* tests/*"'
    exit $1
}

function log {
    if [ "$DEBUG" == "true" ]
    then
        echo "$(basename $0): $@"
    fi
}

while getopts "hvp:e:i:-:" opt
do
    case ${opt} in
        p)
            PYTHONPATH=${OPTARG}
            ;;
        e)
            EXCLUDE=${OPTARG}
            ;;
        i)
            INCLUDE=${OPTARG}
            ;;
        v)
            DEBUG=true
            ;;
        h)
            show_usage 0
            ;;
        \?)
            show_usage 1
            ;;
    esac
done
shift $OPTIND

log "Starting watch with the follwing settings"
log "PYTHONPATH=\"$PYTHONPATH\""
log "EXCLUDE=\"$EXCLUDE\""
log "INCLUDE=\"$INCLUDE\""

pytest "$@"
echo "Waiting for changes..."

inotifywait -q -m -e close_write --exclude "${EXCLUDE}" -r $INCLUDE | while read -r filename event; do
    log "Detected change on file $filename"
    pytest "$@"
    echo "Waiting for changes..."
done
