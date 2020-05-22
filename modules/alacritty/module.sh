
source $DOTFILES_TOOL_PATH/common.sh

REPO=https://raw.githubusercontent.com/srcery-colors/srcery-terminal/master/alacritty/srcery_alacritty.yml
TARGET=$HOME/.config/alacritty/alacritty.yml
CMD=$DOTFILES_CURRENT_MOD_DIR

arch_install() {
    sudo pacman -Syu alacritty
}

_install() {
    has_platform arch && arch_install
    curl -O "$REPO"
    sudo install -o $USER -g $USER -m 755 *.yml $TARGET
}

_remove() {
    sudo rm -rf $TARGET
}

_info() {
    echo -n "Alacrity - The best terminal emulator" && \
        is_installed $TARGET && \
        echo " - [Installed]" || echo ""
}

run_if ubuntu18 arch osx


