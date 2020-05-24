
source $DOTFILES_TOOL_PATH/common.sh

MD=$DOTFILES_CURRENT_MOD_DIR
ENV=$DOTFILES_ENV

_install() {
    mkdir -p $HOME/.config/polybar
    ln -s $MD/config $HOME/.config/polybar/config
}

_remove() {
    rm -rf $HOME/.config/polybar
}

_info() {
    echo -n "Polybar - Fast and light" && \
        is_installed "$HOME/.config/polybar/config" && \
        echo " - [Installed]" || echo ""
}

run_if ubuntu18 arch osx

