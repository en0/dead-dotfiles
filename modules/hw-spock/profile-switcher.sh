#!/usr/bin/bash

PROFILE_TARGET=$HOME/.config/hw/settings.yaml
HEADS=$(xrandr --current | grep "\ connected" | wc -l)
PROFILE_SELECT=$HOME/.dotfiles/modules/hw-spock/settings_${HEADS}.yaml

unlink $PROFILE_TARGET
ln -s $PROFILE_SELECT $PROFILE_TARGET
sudo -u $USER PROFILE_TARGET=$HOME/.dotfiles/modules/i3/scripts/render-configs.sh

