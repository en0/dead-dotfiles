source $DOTFILES_TOOL_PATH/common.sh

MD=$DOTFILES_CURRENT_MOD_DIR
ENV=$DOTFILES_ENV

_install() {
    install -o $USER -g $USER -m 750 -d $HOME/.config/i3
    ln -s $MD/config $HOME/.config/i3/config
    ln -s $MD/scripts $HOME/.config/i3/scripts
}

_remove() {
    unlink $HOME/.config/i3/config
    rm -rf $HOME/.config/i3
}

_info() {
    echo -n "i3 Window Manager - The tiling window manager" && \
        is_installed "$HOME/.config/i3/config" && \
        echo " - [Installed]" || echo ""
}

run_if ubuntu18 arch osx

