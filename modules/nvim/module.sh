source $DOTFILES_TOOL_PATH/common.sh

CMD=$DOTFILES_CURRENT_MOD_DIR
ENV=$DOTFILES_ENV
NVIM_SHARE_TARGET=/usr/local

_install_nodejs() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
    create_env
    ln -s "$CMD/nvm.env" "$ENV.d/nvm.env"
    source "$ENV.d/nvm.env"
    nvm install --lts
    node -v > $HOME/.nvmrc
    source $ENV.d/nvm.env
    npm install -g neovim tree-sitter-cli
}

ubuntu_install() {
    # Install vim
    curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    sudo install -o root -g root -m 755 -d $NVIM_SHARE_TARGET/share/nvim
    sudo install -o root -g root -m 755 ./nvim.appimage $NVIM_SHARE_TARGET/share/nvim/nvim
    sudo ln -s $NVIM_SHARE_TARGET/share/nvim/nvim $NVIM_SHARE_TARGET/bin/nvim

    sudo apt-get install -y python-virtualenv python3-venv

    # install python2 virtual env
    sudo python2 -m virtualenv $NVIM_SHARE_TARGET/share/nvim/python2
    sudo $NVIM_SHARE_TARGET/share/nvim/python2/bin/pip install neovim

    # install python3 virtual env
    sudo python3 -m venv $NVIM_SHARE_TARGET/share/nvim/python3
    sudo $NVIM_SHARE_TARGET/share/nvim/python3/bin/pip install neovim

    _install_nodejs
    # TODO: install nvm
    # TODO: npm install -g neovim
    # TODO: curl -L -O https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
    # TODO: file ripgrep_13.0.0_amd64.deb
    # TODO: sudo dpkg -i ripgrep_13.0.0_amd64.deb
    # TODO: npm -g install tree-sitter-cli

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
    has_platform ubuntu20 && ubuntu_install
    has_platform arch && arch_install
    mkdir -p ~/.config/nvim/
    ln -s $CMD/init.vim          ~/.config/nvim/init.vim
    ln -s $CMD/coc-settings.json ~/.config/nvim/coc-settings.json
    ln -s $CMD/init.d            ~/.config/nvim/init.d
    ln -s $CMD/lua.d             ~/.config/nvim/lua.d
    ln -s $CMD/snips             ~/.config/nvim/snips
    nvim --headless +PlugInstall +qall

    echo "[I] You still need to configure Node.js."
    echo ""
    echo "[I] Install neovim module - npm install -g neovim"
    echo "[I] Install tree-sitter module - npm install -g tree-sitter-cli"
    echo ""
    echo "[W] It's recomended that you install nvm from dotfiles first"
}

_remove() {
    has_platform ubuntu18 && ubuntu_remove
    has_platform ubuntu20 && ubuntu_remove
    has_platform arch && arch_remove
    rm -rf ~/.config/nvim
}

_info() {
    _installed_at=$(which nvim 2>/dev/null || echo "no-exist")
    echo -n "NeoVIM + Plug + MyVIMRC" && \
        is_installed $_installed_at && \
        echo " - [Installed]" || echo ""
}

run_if ubuntu18 ubuntu20 arch osx
