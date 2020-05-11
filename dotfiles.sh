#!/usr/bin/env bash

export DOTFILES_ROOT_PATH=$(dirname "$(readlink -e "$0")")
export DOTFILES_MOD_PATH="$DOTFILES_ROOT_PATH/modules"
export DOTFILES_TOOL_PATH="$DOTFILES_ROOT_PATH/tools"

source $DOTFILES_ROOT_PATH/dotfiles.env
source $DOTFILES_TOOL_PATH/platform.sh
source $DOTFILES_TOOL_PATH/opts.sh
source $DOTFILES_TOOL_PATH/enumerate.sh

if [[ "$DOTFILES_COMMAND" == "env" ]]
then
    echo "Root Path:   $DOTFILES_ROOT_PATH"
    echo "Tool Path:   $DOTFILES_TOOL_PATH"
    echo "Module Path: $DOTFILES_MOD_PATH"
    echo "Target Platform: $DOTFILES_PLATFORM"
    echo "Disabled Modules: $DOTFILES_DISABLED"
    echo "Modules: ${DOTFILES_MODULES[@]}"
    exit
fi

for MOD in ${DOTFILES_MODULES[@]}
do
    export DOTFILES_CURRENT_MOD_NAME=$(echo $MOD)
    export DOTFILES_CURRENT_MOD_DIR=$DOTFILES_MOD_PATH/$MOD
    temp_dir=$(mktemp -d)
    cd ${temp_dir}
    $DOTFILES_CURRENT_MOD_DIR/module.sh
    cd $DOTFILES_ROOT_PATH
    rm -rf $temp_dir
done
