
 " spiiph's
" set statusline=
" set statusline+=%<\                       " cut at start
" set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
" set statusline+=%-40f\                    " path
" set statusline+=%=%1*%y%*%*\              " file type
" set statusline+=%10((%l,%c)%)\            " line and column
" set statusline+=%P                        " percentage of file
 

" " jamessan's
" set statusline=   " clear the statusline for when vimrc is reloaded
" set statusline+=%-3.3n\                      " buffer number
" set statusline+=%f\                          " file name
" set statusline+=%h%m%r%w                     " flags
" set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
" set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
" set statusline+=%{&fileformat}]              " file format
" set statusline+=%=                           " right align
" set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
" set statusline+=%b,0x%-8B\                   " current char
" set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset


 " tpope's
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
"
" 
" " frogonwheels'
" set statusline=%f%w%m%h%1*%r%2*%{exists('b:devpath','<Rel>')}%3*%{exists('b:relpath','<Dev>')}%{XLockStat()}%=%-15(%l,%c%V%)%P
"
"
" " godlygeek's
" let &statusline='%<%f%{&mod?"[+]":""}%r%{&fenc !~ "^$\\|utf-8" || &bomb ? "[".&fenc.(&bomb?"-bom":"")."]" : ""}%=%15.(%l,%c%V %P%)'
"
"
" " Another way to write godlygeeks:
" set statusline=%<%f%m%r%{Fenc()}%=%15.(%l,%c%V\ %P%)
" function! Fenc()
"     if &fenc !~ "^$\|utf-8" || &bomb
"         return "[" . &fenc . (&bomb ? "-bom" : "" ) . "]"
"     else
"         return ""
"     endif
" endfunction
"
