

function! LogFileRead(event, bufno)

    let fname = bufname(a:bufno)
    
    "let fname = expand("<afile>")
    
    "echo fname
    "" Get the full path to the filename
    "let fname = fnamemodify(bufname(a:acmd_bufnr + 0), ':p')
    "if fname == ''
    "    return
    "endif

    " Skip temporary buffers with buftype set. The buftype is set for buffers
    " used by plugins.
    "if &buftype != ''
    "    return
    "endif
    
    let foobar = system('/Users/stu/bin/vimlog.sh' . ' ' . a:event . ' ' . expand('%:p'))
    "let foobar = system('/Users/stu/bin/vimlog.sh', expand('%'))

endfunction


autocmd BufRead * call LogFileRead('Read', expand('<abuf>'))
autocmd BufNewFile * call LogFileRead('NewFile', expand('<abuf>'))
autocmd BufWritePost * call LogFileRead('Write', expand('<abuf>'))
