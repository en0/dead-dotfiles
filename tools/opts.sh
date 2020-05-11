show_usage() {
    echo "Usage: ./$(basename $0) [OPTS] [COMMAND]"
    echo ""
    echo "COMMAND:"
    echo "  env                  Print the env and exit"
    echo "  info                 Print info about available modules."
    echo "  install [MODS|all]   Install 1 or more modules."
    echo "  remove  [MODS|all]   Remove 1 or more modules."
    echo ""
    echo "OPTS:"
    echo "  -p [PLATFORM] : Set an platform override."
}

while getopts "hp:" opt
do

    case ${opt} in
        h)
            show_usage
            exit
            ;;
        p)
            DOTFILES_PLATFORM=${OPTARG}
            ;;
        \? )
            ;;
        esac

done

shift $((OPTIND -1))
DOTFILES_COMMAND=$(echo $@ | cut -d' ' -f1)
shift 1
if [[ -z "$@" ]]
then
    DOTFILES_ARGS=""
else
    DOTFILES_ARGS="$@"
fi

case "$DOTFILES_COMMAND" in
    env) ;;
    info) ;;
    install) ;;
    remove) ;;
    *)
        echo "Unknown command $DOTFILES_COMMAND"
        echo ""
        show_usage
        exit 1
        ;;
esac

export DOTFILES_COMMAND DOTFILES_ARGS DOTFILES_ARGS
