#!/usr/bin/env bash

WD=$(dirname $(readlink -f $0))
JINJA=$WD/../../../venv/bin/jinja2
I3_CONFIG_TMPL=$WD/../i3-config
POLYBAR_CONFIG_TMPL=$WD/../polybar-config
HW_PROFILE=$HOME/.config/hw/settings.yaml

function is_interactive() {
    [ -z "$PS1" ] && echo "Noop"
}

function nag() {
    if is_interactive
    then
        echo "$1" >&2 && exit 1
    else
        i3-nagbar -m "$1" && exit 1
    fi
}

function main() {

    [ ! -f $JINJA ] && nag "Something went wrong. You might need to install a hardware profile." && exit 1
    [ ! -f $HW_PROFILE ] && nag "You have not setup a hardware profile yet. Run ./dotfiles init." && exit 2

    $JINJA $I3_CONFIG_TMPL $HW_PROFILE > ~/.config/i3/config
    $JINJA $POLYBAR_CONFIG_TMPL $HW_PROFILE > ~/.config/polybar/config

    # Might not be running in i3 when this
    # executes so capture failure and ignore it.
    i3-msg restart 2>/dev/null 1>/dev/null || true

}

main "$@"
