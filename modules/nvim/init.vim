for f in split(glob('~/.config/nvim/init.d/*.vim'), '\n')
    exec 'source' f
endfor

