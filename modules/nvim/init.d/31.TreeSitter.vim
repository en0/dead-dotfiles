" https://github.com/nvim-treesitter/nvim-treesitter
" :TSInstall {language}
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "c", "python", "bash", "c_sharp", "cmake",
      "cpp", "css", "devicetree", "dockerfile",
      "erlang", "go", "graphql", "hjson",
      "html", "http", "java", "javascript",
      "json", "json5", "kotlin", "latex", "lua",
      "make", "markdown", "ninja", "php", "regex",
      "rust", "scala", "scheme", "scss", "toml",
      "tsx", "typescript", "vim", "wgsl", "yaml",
      "yang",
  },
  highlight = {enable = true},
}
EOF

" Code Folding
" This depends on the fold method defined in Coc.vim
set foldlevelstart=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
