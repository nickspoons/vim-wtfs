let s:save_cpo = &cpoptions
set cpoptions&vim

nnoremap <buffer> <CR> :call wtfs#view()<CR>
nnoremap <buffer> d :call wtfs#difflatest()<CR>
nnoremap <buffer> D :call wtfs#difflatest()<CR>
xnoremap <buffer> d :call wtfs#diff()<CR>
xnoremap <buffer> D :call wtfs#diff()<CR>
nnoremap <buffer> v V
nnoremap <buffer> q :q<CR>

let &cpoptions = s:save_cpo
