" https://github.com/nvim-treesitter/nvim-treesitter
" :TSInstall {language}
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

" Code Folding
" This depends on the fold method defined in Coc.vim
set foldlevelstart=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
