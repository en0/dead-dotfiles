let mapleader = ","

"" Which key
nnoremap <silent> <leader> :WhichKey '<Leader>'<CR>
nnoremap <silent> g :WhichKey 'g'<CR>
nnoremap <silent> t :WhichKey 't'<CR>

"" Buffer navigation
"map <Leader>n :bp<CR>
"map <Leader>m :bn<CR>
"map <Leader>c :bp<CR>:bd #<CR>
map <Leader>n :BufferPrevious<CR>
map <Leader>m :BufferNext<CR>
map <Leader>c :BufferClose<CR>
map <Leader>N :BufferMovePrevious<CR>
map <Leader>M :BufferMoveNext<CR>

"" Project Explorer
nnoremap <Leader>e :NvimTreeOpen<CR>
nnoremap <C-p> :NvimTreeToggle<CR>

"" Fuzzy Finder
" nnoremap <Leader>f :CocCommand fzf-preview.GitFiles<CR>
nnoremap <Leader>f :CocCommand fzf-preview.DirectoryFiles<CR>
nnoremap <Leader>b :CocCommand fzf-preview.Buffers<CR>
nnoremap <Leader>F :call FzfGrep()<CR>
nnoremap <Leader>G :CocCommand fzf-preview.GitStatus<CR>


"" Coc Integration
" GoTo code navigation (Coc).
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gm <Plug>(git-messenger)
nmap <silent> gg :0<CR>
nmap <silent> gt :TestVisit

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

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


" Python
autocmd FileType python map <Leader>p :call InsertBreakpoint()<CR>

function! InsertBreakpoint()
  let trace = expand("import pdb; pdb.set_trace()")
  execute "normal o".trace
endfunction

autocmd FileType python map <Leader>S :call InsertUnittestSkip()<CR>

function! InsertUnittestSkip()
  let line = expand("@unittest.skip('WIP')")
  execute "normal O".line
endfunction

autocmd FileType python nnoremap <buffer><Leader>i :exec '!isort %'<CR>

" Unit Test
nmap <silent> tf :TestNearest<CR>
nmap <silent> tt :TestLast<CR>
nmap <silent> tb :TestFile<CR>
nmap <silent> tg :TestVisit<CR>
