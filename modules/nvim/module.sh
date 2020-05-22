source $DOTFILES_TOOL_PATH/common.sh

CMD=$DOTFILES_CURRENT_MOD_DIR
NVIM_SHARE_TARGET=/usr/local

ubuntu_install() {
    # Install vim
    curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    sudo install -o root -g root -m 755 -d $NVIM_SHARE_TARGET/share/nvim
    sudo install -o root -g root -m 755 ./nvim.appimage $NVIM_SHARE_TARGET/share/nvim/nvim
    sudo ln -s $NVIM_SHARE_TARGET/share/nvim/nvim $NVIM_SHARE_TARGET/bin/nvim

    sudo apt-get install -y python-virtualenv python3-virtualenv

    # install python2 virtual env
    sudo python2 -m virtualenv $NVIM_SHARE_TARGET/share/nvim/python2
    sudo $NVIM_SHARE_TARGET/share/nvim/python2/bin/pip install pynvim

    # install python3 virtual env
    sudo python3 -m venv $NVIM_SHARE_TARGET/share/nvim/python3
    sudo $NVIM_SHARE_TARGET/share/nvim/python3/bin/pip install pynvim

    # install vim-plug
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

ubuntu_remove() {
    sudo unlink $NVIM_SHARE_TARGET/bin/nvim
    sudo rm -rf $NVIM_SHARE_TARGET/share/nvim
    rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
}

arch_install() {
    sudo pacman -Syu neovim python python2 python2-virtualenv
    sudo install -o root -g root -m 755 -d $NVIM_SHARE_TARGET/share/nvim

    # install python2 virtual env
    sudo python2 -m virtualenv $NVIM_SHARE_TARGET/share/nvim/python2
    sudo $NVIM_SHARE_TARGET/share/nvim/python2/bin/pip install pynvim

    # install python3 virtual env
    sudo python3 -m venv $NVIM_SHARE_TARGET/share/nvim/python3
    sudo $NVIM_SHARE_TARGET/share/nvim/python3/bin/pip install pynvim

    # install vim-plug
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

arch_remove() {
    sudo unlink $NVIM_SHARE_TARGET/bin/nvim
    sudo rm -rf $NVIM_SHARE_TARGET/share/nvim
    rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
}

_install() {
    has_platform ubuntu18 && ubuntu_install
    has_platform arch && arch_install
    mkdir -p ~/.config/nvim/init.d
    ln -s $CMD/init.vim ~/.config/nvim/init.vim
    for f in $(find $CMD/init.d -type f)
    do
        ln -s $f ~/.config/nvim/init.d/$(basename $f)
    done
    nvim --headless +PlugInstall +qall
}

_remove() {
    has_platform ubuntu18 && ubuntu_remove
    has_platform arch && arch_remove
    rm -rf ~/.config/nvim
}

_info() {
    echo -n "NeoVIM + Plug + MyVIMRC" && \
        is_installed $NVIM_SHARE_TARGET/bin/nvim && \
        echo " - [Installed]" || echo ""
}

run_if ubuntu18 arch osx
