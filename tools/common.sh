has_platform() {
    for REQUIRED in $@
    do
        [[ $REQUIRED == $DOTFILES_PLATFORM ]] && true && return
    done
    false
}

is_installed() {
    [ -f $1 ]
}

run() {
    case "$DOTFILES_COMMAND" in
        install) echo "Installing module \"$DOTFILES_CURRENT_MOD_NAME\"" && _install ;;
        remove) echo "Removing module \"$DOTFILES_CURRENT_MOD_NAME\"" && _remove ;;
        info) echo "Info about module \"$DOTFILES_CURRENT_MOD_NAME\"" && _info ;;
    esac
    echo ""
}

run_if() {
    has_platform $@ && run || echo "Module \"$DOTFILES_CURRENT_MOD_NAME\" does not support platform \"$DOTFILES_PLATFORM\""
}

create_env() {
    [ ! -f $DOTFILES_ENV ] && cat >$DOTFILES_ENV<<EOF
for f in $DOTFILES_ENV.d/*
do
    source \$f
done
EOF
    [ ! -d $DOTFILES_ENV.d ] && mkdir -p $DOTFILES_ENV.d
}

remove_env() {
    [ -z "$(ls $DOTFILES_ENV.d)" ] && rmdir $DOTFILES_ENV.d && rm -f $DOTFILES_ENV
}
