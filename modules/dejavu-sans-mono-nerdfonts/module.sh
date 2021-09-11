source $DOTFILES_TOOL_PATH/common.sh

MD=$DOTFILES_CURRENT_MOD_DIR
ENV=$DOTFILES_ENV
FONT_DIR=$HOME/.local/share/fonts/
MANIFEST_FILE=$FONT_DIR/dejavu-sands-mono-nerfonts.manifest

_install() {
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip
    unzip DejaVuSansMono.zip
    mkdir -p $FONT_DIR
    ls *.ttf > $MANIFEST_FILE
    mv *.ttf $FONT_DIR
    fc-cache -f $FONT_DIR
}

_remove() {
    while read -r line
    do
        rm -f $line
    done < $MANIFEST_FILE
    rm -f $MANIFEST_FILE
    fc-cache -f $FONT_DIR
}

_info() {
    echo -n "Nerd Font - NerdFont patched DejaVuSansMono" && \
        is_installed $MANIFEST_FILE && \
        echo " - [Installed]" || echo ""
}

run_if ubuntu18 ubuntu20 arch osx
