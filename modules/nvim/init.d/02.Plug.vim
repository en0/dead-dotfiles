call plug#begin()

    " https://github.com/neoclide/coc.nvim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " https://github.com/pappasam/coc-jedi
    Plug 'pappasam/coc-jedi', {'do': 'yarn install --frozen-lockfile && yarn build'}

    " https://github.com/kevinoid/vim-jsonc
    Plug 'kevinoid/vim-jsonc'

    " https://github.com/yuki-yano/fzf-preview.vim#installation
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    " https://github.com/nvim-treesitter/nvim-treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

    " https://github.com/glepnir/galaxyline.nvim
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

    " https://github.com/kyazdani42/nvim-tree.lua
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'

    " https://github.com/romgrk/barbar.nvim
    Plug 'romgrk/barbar.nvim'

    " https://github.com/liuchengxu/vim-which-key
    Plug 'liuchengxu/vim-which-key'

    " https://github.com/ntpeters/vim-better-whitespace
    Plug 'ntpeters/vim-better-whitespace'

    " https://github.com/mhinz/vim-startify
    Plug 'mhinz/vim-startify'

    " https://github.com/airblade/vim-gitgutter
    Plug 'airblade/vim-gitgutter'

    " https://github.com/rhysd/git-messenger.vim
    Plug 'rhysd/git-messenger.vim'

    Plug 'srcery-colors/srcery-vim'

call plug#end()
