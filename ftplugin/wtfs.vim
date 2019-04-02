let s:save_cpo = &cpoptions
set cpoptions&vim

let b:undo_ftplugin = get(b:, 'undo_ftplugin', 'exe')

nnoremap <buffer> <CR> :call wtfs#view()<CR>
nnoremap <buffer> d :call wtfs#difflatest()<CR>
nnoremap <buffer> D :call wtfs#difflatest()<CR>
xnoremap <buffer> d :call wtfs#diff()<CR>
xnoremap <buffer> D :call wtfs#diff()<CR>
nnoremap <buffer> v V
nnoremap <buffer> q :q<CR>

let b:undo_ftplugin .= '|sil! exe "nunmap <buffer> <CR>"'
let b:undo_ftplugin .= '|sil! exe "nunmap <buffer> d"'
let b:undo_ftplugin .= '|sil! exe "nunmap <buffer> D"'
let b:undo_ftplugin .= '|sil! exe "xunmap <buffer> d"'
let b:undo_ftplugin .= '|sil! exe "xunmap <buffer> D"'
let b:undo_ftplugin .= '|sil! exe "nunmap <buffer> v"'
let b:undo_ftplugin .= '|sil! exe "nunmap <buffer> p"'

let &cpoptions = s:save_cpo
