set t_Co=256
set termguicolors
set background=dark
autocmd ColorScheme * set cursorline
autocmd ColorScheme * set cursorcolumn
colorscheme srcery
let g:srcery_bold = 1
let g:srcery_italic = 1
let g:srcery_transparent_background = 1
let g:srcery_underline = 1
let g:srcery_undercurl = 1
let g:srcery_inverse = 1
let g:srcery_inverse_matches = 1
let g:srcery_inverse_match_paren = 1
let g:srcery_dim_lisp_paren = 1
let g:airline = { 'colorscheme': 'srcery' }
