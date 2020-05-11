source $DOTFILES_TOOL_PATH/common.sh

CMD=$DOTFILES_CURRENT_MOD_DIR
TARGET=/usr/local/bin/nvim

ubuntu_install() {
    curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    sudo install -o root -g root -m 755 ./nvim.appimage $TARGET
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

ubuntu_remove() {
    sudo rm -rf /usr/local/bin/nvim
    rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
}

_install() {
    has_platform ubuntu18 && ubuntu_install
    mkdir -p ~/.config/nvim/init.d
    ln -s $CMD/init.vim ~/.config/nvim/init.vim
    for f in $(find $CMD/init.d -type f)
    do
        ln -s $f ~/.config/nvim/init.d/$(basename $f)
    done
    # TODO: Install python package
    nvim --headless +PlugInstall +qall
}

_remove() {
    has_platform ubuntu18 && ubuntu_remove
    rm -rf ~/.config/nvim
}

_info() {
    echo "NeoVIM + Plug + MyVIMRC"
    which /usr/local/bin/nvim 1>/dev/null 2> /dev/null && echo "Already installed"
}

run_if ubuntu18 arch osx
