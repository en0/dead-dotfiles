has_platform() {
    for REQUIRED in $@
    do
        [[ $REQUIRED == $DOTFILES_PLATFORM ]] && true && return
    done
    false
}

is_installed() {
    which $1 1>/dev/null 2> /dev/null && true || false
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
