source $DOTFILES_TOOL_PATH/common.sh

MD=$DOTFILES_CURRENT_MOD_DIR
ENV=$DOTFILES_ENV

_install() {
    git clone https://github.com/powerline/fonts
    cd fonts
    sudo ./install.sh
}

_remove() {
    echo "Sorry, you are on your own."
}

_info() {
    echo -n "Powerline Fonts - patched fonts with extra glyphs"
}

run_if ubuntu18 ubuntu20 arch osx
