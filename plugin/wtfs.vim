if exists('g:loaded_wtfs')
  finish
endif
let g:loaded_wtfs = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

command! -nargs=0 -bar TFHistory call wtfs#history()
command! -nargs=0 -bar TFStatus call wtfs#status()

let &cpoptions = s:save_cpo
