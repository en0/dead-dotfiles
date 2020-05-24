source $DOTFILES_TOOL_PATH/common.sh

MD=$DOTFILES_CURRENT_MOD_DIR
ENV=$DOTFILES_ENV

_install() {
    install -o $USER -g $USER -m 750 -d $HOME/.config/i3
    install -o $USER -g $USER -m 750 -d $HOME/.config/polybar
    ln -s $MD/i3-config $HOME/.config/i3/config
    ln -s $MD/polybar-config $HOME/.config/polybar/config
    ln -s $MD/scripts $HOME/.config/i3/scripts
}

_remove() {
    rm -rf $HOME/.config/i3
    rm -rf $HOME/.config/polybar
}

_info() {
    echo -n "i3 Window Manager - The tiling window manager" && \
        is_installed "$HOME/.config/i3/config" && \
        echo " - [Installed]" || echo ""
}

run_if ubuntu18 arch osx

