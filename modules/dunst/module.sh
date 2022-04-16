source $DOTFILES_TOOL_PATH/common.sh

TARGET=$HOME/.dunstrc
MD=$DOTFILES_CURRENT_MOD_DIR

_install() {
    ln -s $MD/dunstrc $TARGET
}

_remove() {
    unlink $TARGET
}

_info() {
    echo -n "Dunst configuration - Notificaiton manager" && \
        is_installed $TARGET && \
        echo " - [Installed]" || echo ""
}

run_if ubuntu18 ubuntu20 arch osx

