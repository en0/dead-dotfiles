source $DOTFILES_TOOL_PATH/common.sh

MD=$DOTFILES_CURRENT_MOD_DIR
ENV=$DOTFILES_ENV

_install() {
    install -o $USER -g $USER -m 750 -d $HOME/.config/i3
    install -o $USER -g $USER -m 750 -d $HOME/.config/polybar
    [ ! -d $HOME/.config/i3/scripts ] && ln -s $MD/scripts $HOME/.config/i3/scripts
    [ ! -d $HOME/.config/i3/wallpaper ] && ln -s $MD/wallpaper $HOME/.config/i3/wallpaper
    [ ! -f $HOME/.config/i3/config ] && $MD/scripts/render-configs.sh
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

run_if ubuntu18 ubuntu20 arch osx

