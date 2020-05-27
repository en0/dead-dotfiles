[ ! -d $DOTFILES_ROOT_PATH/venv ] && \
    python3 -m venv venv && \
    $DOTFILES_ROOT_PATH/venv/bin/pip install -r requirements.txt

[ ! -d $DOTFILES_ROOT_PATH/venv ] && \
    echo "Cannot create python environment. You have to do it yourself." && \
    echo "Don't forget to install requirements.txt [pip install -r requirements.txt]" && \
    exit 1
