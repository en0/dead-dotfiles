DOTFILES_MODULES=()

if [[ -z "$DOTFILES_ARGS" ]]
then
    for MOD in $(find $DOTFILES_MOD_PATH -maxdepth 2 -type f -name module.sh)
    do
        MOD=$(dirname "${MOD#$DOTFILES_MOD_PATH/}")
        [[ ",$DOTFILES_DISABLED," == *",$MOD,"* ]] && continue
        DOTFILES_MODULES+=($MOD)
    done
else
    for MOD in $DOTFILES_ARGS
    do
        [ ! -d "$DOTFILES_MOD_PATH/$MOD" ] && echo "No moduled named \"$MOD\"" && exit 2
        DOTFILES_MODULES+=($MOD)
    done
fi

export DOTFILES_MODULES
