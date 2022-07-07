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
    echo -n "Workspace-lite - Terminal as an IDE but less complex" && \
        is_installed "$ENV.d/workspace.env" && \
        echo " - [Installed]" || echo ""
}

run_if ubuntu18 ubuntu20 ubuntu21 ubuntu22 arch osx
