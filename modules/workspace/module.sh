source $DOTFILES_TOOL_PATH/common.sh

MD=$DOTFILES_CURRENT_MOD_DIR
ENV=$DOTFILES_ENV

_install() {
    create_env
    ln -s "$MD/workspace.env" "$ENV.d/workspace.env"
}

_remove() {
    unlink "$ENV.d/workspace.env"
    remove_env
}

_info() {
    echo -n "Workspace - A set of functions to make using mutiple terminals easier" 
}

run_if ubuntu18 arch osx
