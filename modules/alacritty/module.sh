
source $DOTFILES_TOOL_PATH/common.sh

TARGET=$HOME/.config/alacritty/alacritty.yml
MD=$DOTFILES_CURRENT_MOD_DIR
CMD=$DOTFILES_CURRENT_MOD_DIR

arch_install() {
    sudo pacman -Syu alacritty
}

_install() {
    has_platform arch && arch_install
    mkdir -p $(dirname $TARGET)
    ln -s $MD/alacritty.yml $TARGET
}

_remove() {
    rm -rf $(dirname $TARGET)
}

_info() {
    echo -n "Alacrity - The best terminal emulator" && \
        is_installed $TARGET && \
        echo " - [Installed]" || echo ""
}

run_if ubuntu18 arch osx


