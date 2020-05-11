source $DOTFILES_TOOL_PATH/common.sh

REPO=https://github.com/junegunn/fzf.git
TARGET=/usr/local/bin/fzf
CMD=$DOTFILES_CURRENT_MOD_DIR

_install() {
    git clone --depth 1 "${REPO}"
    fzf/install --bin
    sudo install -o root -g root -m 755 fzf/bin/fzf $TARGET
}

_remove() {
    sudo rm -rf $TARGET
}

_info() {
    echo -n "FZF - Commandline Fuzzy Finder" && \
        is_installed $TARGET && \
        echo " - [Installed]" || echo ""
}

run_if ubuntu18 arch osx
