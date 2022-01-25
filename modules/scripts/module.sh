
source $DOTFILES_TOOL_PATH/common.sh

MD=$DOTFILES_CURRENT_MOD_DIR
ENV=$DOTFILES_ENV

_install() {
    create_env
    ls $MD/env | xargs -n1 -i% ln -s $MD/env/% $ENV.d/%
}

_remove() {
    unlink "$ENV.d/scripts.env"
    remove_env
}

_info() {
    echo -n "Scripts - Just some scripts" && \
        is_installed "$ENV.d/scripts.env" && \
        echo " - [Installed]" || echo ""
}

run_if ubuntu18 ubuntu20 ubuntu21 arch osx
