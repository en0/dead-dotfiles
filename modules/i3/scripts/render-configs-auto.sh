#!/usr/bin/env bash

WD=$(dirname $(readlink -f $0))
JINJA=$WD/../../../venv/bin/jinja2
PYTHON=$WD/../../../venv/bin/python
I3_CONFIG_TMPL=$WD/../i3-config
POLYBAR_CONFIG_TMPL=$WD/../polybar-config
GLOBAL_SETTINGS=$WD/../settings.yaml
HW_SETTINGS=$HOME/.config/hw/settings.yaml

function is_interactive() {
    [ ! -z "$PS1" ] && echo "Noop"
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

    [ ! -f $JINJA ] && nag "Something went wrong. You might need to install a hardware profile."
    [ ! -f $HW_SETTINGS ] && nag "You have not setup a hardware settings yet. Run ./dotfiles install hw_[YOUR PROFILE]."

    TEMP=$(mktemp -d)

    cd $TEMP

    # Autoload the first detected profile
    autorandr --change

    # Autodetect monitor layout based on xrandr active monitors
    COUNTER=0
    MONITOR_LABEL=("primary" "secondary" "tertiary")
    AUTO_SETTINGS=$TEMP/auto.yaml

    echo "display:" > $AUTO_SETTINGS
    for MON in $(xrandr --listactivemonitors | tail -n +2 | awk '{print $4}')
    do
        echo "  ${MONITOR_LABEL[$COUNTER]}: $MON"  >> $AUTO_SETTINGS
        COUNTER=$(($COUNTER + 1))
    done

    # merge settings
    $PYTHON << EOF
from yaml import load, Loader, dump, Dumper

def merge(a, b):
  if b is None:
    return a
  if type(a) is dict:
    for key, val in a.items():
      a[key] = merge(val, b.get(key))
    for key, val in b.items():
      if key not in  a:
        a[key] = merge(val, None)
    return a
  elif type(a) is list:
    return a + b
  else:
    return b

with open("$GLOBAL_SETTINGS") as fd1:
  d1 = load(fd1, Loader=Loader)
  print("d1", d1)
  print("\n")

with open("$HW_SETTINGS") as fd2:
  d2 = load(fd2, Loader=Loader)
  print("d2", d2)
  print("\n")

with open("$AUTO_SETTINGS") as fd3:
  d3 = load(fd3, Loader=Loader)
  print("d3", d3)
  print("\n")

merge(d1, d2)
merge(d1, d3)
print("d1", d1)
print("\n")

with open("./settings.yaml", "w") as fd3:
    fd3.write(dump(d1, Dumper=Dumper))
EOF
    cd -
    echo $TEMP

    [ ! -f $TEMP/settings.yaml ] && nag "Failed to merge. Check your settings.yaml."

    $JINJA $I3_CONFIG_TMPL $TEMP/settings.yaml > $TEMP/i3-config
    [[ $? != 0 ]] && rm -rf $TEMP && nag "Failed to render i3-config. Check your template."
    mv $TEMP/i3-config ~/.config/i3/config

    $JINJA $POLYBAR_CONFIG_TMPL $TEMP/settings.yaml > $TEMP/polybar-config
    [[ $? != 0 ]] && rm -rf $TEMP && nag "Failed to render polybar-config. Check your template."
    mv $TEMP/polybar-config ~/.config/polybar/config

    rm -rf $TEMP

    # Might not be running in i3 when this
    # executes so capture failure and ignore it.
    i3-msg restart 2>/dev/null 1>/dev/null || true

}

main "$@"

