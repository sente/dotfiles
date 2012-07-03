" Vim filetype plugin file
" Language:	Make
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2006 Jun 17

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Make sure a hard tab is used, required for most make programs

map <buffer> <Leader>0 :s/#//<Return>
map <buffer> <Leader>9 :s/^/#/<Return>

setlocal sts=4 sw=4 ts=4 et

setlocal omnifunc=pythoncomplete#Complete

set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"

set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>




" http://stackoverflow.com/questions/601039/vim-save-and-run-at-the-same-time

command! -complete=file -nargs=+ Shell call s:runshellcommand(<q-args>)

function! s:runshellcommand(cmdline)
    botright vnew
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1,a:cmdline)
    call setline(2,substitute(a:cmdline,'.','=','g'))
    execute 'silent $read !'.escape(a:cmdline,'%#')
    setlocal nomodifiable
    1
endfunction

map <F9> :w<CR>:Shell python % <CR><C-W>


" a quick and dirty fix so PythonErrors aren't so ugly looking...
" see - http://i.imgur.com/ASmiY.png
hi pythonSpaceError  ctermbg=235
hi pythonError  ctermbg=235
