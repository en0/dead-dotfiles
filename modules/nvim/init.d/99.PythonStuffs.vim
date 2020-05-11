map <Leader>p :call InsertBreakpoint()<CR>

function! InsertBreakpoint()
  let trace = expand("import pdb; pdb.set_trace()")
  execute "normal o".trace
endfunction

map <Leader>S :call InsertUnittestSkip()<CR>

function! InsertUnittestSkip()
  let line = expand("@unittest.skip('WIP')")
  execute "normal O".line
endfunction

