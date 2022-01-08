
source $DOTFILES_TOOL_PATH/common.sh

MD=$DOTFILES_CURRENT_MOD_DIR
ENV=$DOTFILES_ENV

_install() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
    create_env
    ln -s "$MD/nvm.env" "$ENV.d/nvm.env"
    source "$ENV.d/nvm.env"
    nvm install --lts
    node -v > $HOME/.nvmrc
    echo [i] You will need to source $ENV.d/nvm.env or open a new terminal
}

_remove() {
    unlink "$ENV.d/nvm.env"
    remove_env
}

_info() {
    echo -n "NVM - The Node.js Version Manager" && \
        is_installed "$ENV.d/nvm.env" && \
        echo " - [Installed]" || echo ""
}

run_if ubuntu18 ubuntu20 ubuntu21 arch osx
