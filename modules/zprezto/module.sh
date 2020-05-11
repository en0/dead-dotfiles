source $DOTFILES_TOOL_PATH/common.sh

CMD=$DOTFILES_CURRENT_MOD_DIR

_install() {
    echo "not implemented"
}

_remove() {
    echo "not implemented"
}

_info() {
    echo "NeoVIM and Dotfiles"
}

run_if ubuntu18 arch osx
