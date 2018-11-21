if exists('g:loaded_wtfs')
  finish
endif
let g:loaded_wtfs = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

command! -nargs=0 TFHistory call wtfs#history()

let &cpoptions = s:save_cpo
