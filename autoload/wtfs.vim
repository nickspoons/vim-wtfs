let s:save_cpo = &cpoptions
set cpoptions&vim

function! wtfs#diff() range abort
  let csfirst = s:get_changeset(a:firstline)
  let cslast  = s:get_changeset(a:lastline)
  if a:firstline == a:lastline
    call wtfs#difflatest()
    return
  endif
  if str2nr(csfirst) > str2nr(cslast)
    let [csfirst, cslast] = [cslast, csfirst]
  endif
  let filename = w:filename
  let ft = w:ft
  call s:tabnew(fnamemodify(filename, ':t') . ' C' . csfirst . '-C' . cslast)
  call s:view(filename, ft, csfirst)
  diffthis
  botright vnew
  call s:view(filename, ft, cslast)
  diffthis
endfunction

function! wtfs#difflatest() abort
  let changeset = s:get_changeset(line('.'))
  let filename = w:filename
  let ft = w:ft
  wincmd p
  leftabove vnew
  call s:view(filename, ft, changeset)
  diffthis
  wincmd p
  diffthis
endfunction

function! wtfs#history() abort
  let filename = fnameescape(expand('%:.'))
  echo 'Fetching tfs history...'
  let ft = &filetype
  let cmd = 'tf history /format:brief ' . filename
  " TODO: use a job
  let output = system(cmd)
  " Split the string into an array, and strip the first 2 header lines
  let output = split(output, "\n")[2:]
  call s:wtfslist_open(output, filename, ft)
endfunction

function! wtfs#view() abort
  let changeset = s:get_changeset(line('.'))
  let filename = w:filename
  let ft = w:ft
  call s:tabnew(fnamemodify(filename, ':t') . ':C' . changeset)
  call s:view(filename, ft, changeset)
endfunction

function! s:view(filename, ft, changeset) abort
  setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
  let &filetype = a:ft
  execute 'silent read !tf vc view /version:C' . a:changeset a:filename
  execute 'silent file' a:filename . ':C' . a:changeset
  0delete_
endfunction

function! s:get_changeset(lnum) abort
  return matchstr(getline(a:lnum), '^\s*\zs\d*')
endfunction

function! s:tabnew(tabname) abort
  tabnew
  if exists(':TabooRename')
    execute 'TabooRename' a:tabname
  endif
endfunction

function! s:wtfslist_open(content, filename, ft) abort
  execute 'silent pedit ++fileformat=dos WTFS history:' a:filename
  silent wincmd P
  execute 'resize' min([&previewheight, len(a:content)])
  let w:wtfs = 1
  let w:filename = a:filename
  let w:ft = a:ft
  setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile filetype=wtfs
  call setline(1, a:content)
  echon "\r\r"
  echon ''
endfunction

let &cpoptions = s:save_cpo
