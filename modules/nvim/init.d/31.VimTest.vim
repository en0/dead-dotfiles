" make test commands execute using dispatch.vim
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'dispatch',
  \ 'suite':   'asyncrun',
\}
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif
