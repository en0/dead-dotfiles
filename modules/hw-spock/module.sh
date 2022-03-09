
source $DOTFILES_TOOL_PATH/common.sh

TARGET=$HOME/.config/hw/settings.yaml
MD=$DOTFILES_CURRENT_MOD_DIR
CMD=$DOTFILES_CURRENT_MOD_DIR

_install() {
    install -o $USER -g $USER -m 750 -d $(dirname $TARGET)
    ln -s $MD/settings.yaml $TARGET
}

_remove() {
    unlink $TARGET
}

_info() {
    echo -n "Hardware Profile - Profile for spock" && \
        is_installed $TARGET && \
        echo " - [Installed]" || echo ""
}

run_if ubuntu18 ubuntu20 ubuntu21 arch osx


