for f in split(glob('~/.config/nvim/init.d/*.vim'), '\n')
    exec 'source' f
endfor

for l in split(glob('~/.config/nvim/lua.d/*.lua'), '\n')
    exec 'luafile' l
endfor
