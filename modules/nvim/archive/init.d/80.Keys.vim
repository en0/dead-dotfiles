let mapleader = ","

" Buffer Nav
map <Leader>n :bp<CR>
map <Leader>m :bn<CR>
map <Leader>c :bp<CR>:bd #<CR>
map <Leader>b :call fzf#run({
    \ 'source': map(range(1, bufnr('$')), 'bufname(v:val)'),
    \ 'sink': 'e', 'down': '30%',
    \ })<CR>

" File Nav
map <Leader>f :FZF<CR>
map <leader>e :NERDTreeToggle<CR>
map <C-p> :NERDTreeFocus<CR>

" Searching
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Better indent control
vnoremap < <gv
vnoremap > >gv

" Format Text
vmap Q gq
nmap Q gqap

" Spelling! ya.
map <F7> :setlocal spell! spelllang=en_us<CR>

" Because you always forget
command WW w !sudo tee %

" Escape terminal mode
tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l

" Jedi
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#popup_select_first = 0

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
