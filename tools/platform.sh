case "$OSTYPE" in
linux-gnu)
    source /etc/os-release
    DOTFILES_PLATFORM=$(echo $ID${VERSION_ID%%.*})
    ;;
darwin)
    DOTFILES_PLATFORM="osx$(sw_vers -productVersion | cut -d'.' -f1)"
    ;;
*)
    DOTFILES_PLATFORM="uknown"
    ;;
esac

export DOTFILES_PLATFORM
