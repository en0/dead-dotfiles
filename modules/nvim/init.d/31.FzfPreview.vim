" https://github.com/yuki-yano/fzf-preview.vim#installation

function! FzfGrep()
    " You need ripgrep <https://github.com/BurntSushi/ripgrep#installation>
    let word = input('Grep For: ')
    execute ":CocCommand fzf-preview.ProjectGrep ". l:word
endfunction
