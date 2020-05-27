[ ! -d $DOTFILES_ROOT_PATH/venv ] && \
    python -m venv venv && \
    $DOTFILES_ROOT_PATH/venv/bin/pip install -r requirements.txt
