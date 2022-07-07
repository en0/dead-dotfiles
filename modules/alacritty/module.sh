
source $DOTFILES_TOOL_PATH/common.sh

TARGET=$HOME/.config/alacritty/alacritty.yml
MD=$DOTFILES_CURRENT_MOD_DIR
CMD=$DOTFILES_CURRENT_MOD_DIR

arch_install() {
    sudo pacman -Syu alacritty
}

ubuntu_install() {
    sudo add-apt-repository --yes ppa:aslatter/ppa
    sudo apt-get update --yes
    sudo apt-get install --yes alacritty
}

_install() {
    has_platform arch && arch_install
    has_platform ubuntu18 && ubuntu_install
    has_platform ubuntu20 && ubuntu_install
    has_platform ubuntu21 && ubuntu_install
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

run_if ubuntu18 ubuntu20 ubuntu21 ubuntu22 arch osx


