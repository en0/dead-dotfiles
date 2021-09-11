" markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" makefiles
autocmd FileType make setlocal noexpandtab

" crontab
autocmd FileType crontab setlocal bkc=yes

" Python files Fold Method
"autocmd FileType python setlocal foldmethod=indent

" Fold method for everying else
" autocmd FileType c,cpp,vim,xml,html,xhtml,typescript,javascript setlocal foldmethod=syntax
