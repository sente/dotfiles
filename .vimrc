" Stuart Powers
" http://sente.cc/
" http://www.github.com/sente/dotfiles/

au BufNewFile,BufRead .pryrc            set filetype=ruby


" useful resources:
" http://www.ibm.com/developerworks/linux/library/l-vim-script-1/index.html
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
" http://RAYNInfo.co.uk/vimtips.html
" https://github.com/alfredodeza/dotfiles/blob/master/.vimrc
" https://github.com/mitsuhiko/dotfiles/blob/master/vim/vimrc

" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html#

"set noerrorbells visualbell t_vb=
" colorscheme mustang
" colorscheme impact

set nocompatible

filetype plugin indent on
syntax on


call pathogen#infect()

if $TERM =~ '^screen' && exists("+ttymouse") && &ttymouse == ''
    set ttymouse=xterm
endif

let NERDTreeIgnore=['\.pyc$', '\~$']


" there's probably a better place to put this...
let &t_Co=256
" I really shouldn't have this here..
colorscheme inkpot

"colorscheme solarized
"let g:solarized_termcolors=256
"set background=dark
"highlight :background

nnoremap <F5> :GundoToggle<CR>

highlight StatusLine ctermfg=blue ctermbg=yellow
highlight Directory  ctermfg=red

set bg=dark
set et sw=4 ts=4
set ignorecase
set smartcase
set mouse=a
set laststatus=2
set highlight=l:Visual 
set scrolloff=5
set number
set numberwidth=1
set nowrap	
set autoindent	
set cmdwinheight=15
set wildmenu
set wildmode=list:longest,full
set isfname-==  " removed '=' since we don't want that ruining our autocomplete
set whichwrap=b,s,h,l
set viminfo='50,<1000,s100,:100,n~/.viminfo
set pastetoggle=<F12>
set modeline
set modelines=5

" StatusInfoHelper() and SynName() defined below
set statusline=%m\ %-f%=\ \ \ \ %{SynName()}\ %{StatusInfoHelper()}\ %([%l:%c\:%02p%%]%)


" diff between the current buffer and the original file
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis



let mapleader = ","

nnoremap <leader>w <C-w>v<C-w>l

"makes ;; auto-complete while in insert mode
imap ;; <C-P>

"ctrl-\ inserts the current file's path
cmap <C-\> <C-R>=expand("%:p:h") . "/" <CR>
cmap <C-\>\ <C-R>=expand("%:p:n") <CR>

nmap <leader>l :set list!<CR>

map <C-p> :bnext<CR>
map <C-n> :bprevious<CR>
map <Leader>3 :s/\t/\r/g<Enter>
map <Leader>4 :s/\|/\r/g<Enter>
map <Leader>5 :s/,/\r/g<Enter>

map <Leader>f :s/^/"/<CR>gv:s/$/",/<CR>
map <Leader>a :s/"\(.*\)"/"\1=_foo_\1"/<CR>

map <Leader>d :diffthis<Return><C-W><C-W>:diffthis<Return>
map <Leader>o :diffoff<Return><C-W><C-W>:diffoff<Return>:set nowrap<Return>

map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>


vmap < <gv
vmap > >gv

vmap <C-c> :w! ~/.vbuf<CR>
nmap <C-c> :.w! ~/.vbuf<CR>
nmap <C-v> :r ~/.vbuf<CR>

vmap <leader><C-c> :w! ~/.vbuf.
nmap <leader><C-c> :.w! ~/.vbuf.
nmap <leader><C-v> :r ~/.vbuf.

nnoremap ' `
nnoremap ` '

"make scrolling faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-l> <C-W>l



" allow for 'Man foo' functionality
runtime! ftplugin/man.vim

"http://twitter.com/#!/dotvimrc/status/108977303400357888
"open a quickfix window of last search term
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>


"fold HTML tags with <leader>f
au FileType html setlocal foldmethod=manual
au FileType html nnoremap <buffer> <leader>f Vatzf


"hilight word under cursor
nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>

hi def link InterestingWord1 Todo
hi def link InterestingWord2 Error
hi def link InterestingWord3 Todo
"hi InterestingWord1 guifg=#000000 guibg=#FFA700
"hi InterestingWord2 guifg=#000000 guibg=#53FF00
"hi InterestingWord3 guifg=#000000 guibg=#FF74F8


colorscheme inkpot


noremap <silent> <F10> :call IncrementOpt("tabstop",2,-2,500)<BAR>set tabstop?<CR>
noremap <silent> <F11> :call IncrementOpt("tabstop",2,2,500)<BAR>set tabstop?<CR>
imap <F10> <C-O><F10>
imap <F11> <C-O><F11>


" http://vim.wikia.com/wiki/Handy_option_flag_toggler
function IncrementOpt(option,min,inc,max)
  exec ('let tz_value = (((&'.a:option.'-'.a:min.')+'.a:inc.')%(('.a:max.'-'.a:min.')+'.a:inc.'))+'.a:min)
  if (tz_value > a:max || tz_value < a:min) " in case inc<0
    let tz_value = a:min
  endif
  exec ('setlocal '.a:option.'='.tz_value)
endfunction




source $HOME/.vim/extras.vim



fun! StatusInfoHelper()
	let fmt = 'ft=%s ts=%d sw=%d %s'
	let x = printf(fmt, &ft, &ts, &sw ,(&et?"et":"noet"))
	return x
endf

fun! SynName()
    "returns the syntax type 'name' for the word under the cursor
	let x = synIDattr(synID(line('.'),col('.'),1),'name')
	return x
endf

fun! Synfg()
	let x = synIDattr(synID(line('.'),col('.'),1),'fg')
	return x
endf





if has('python')
	runtime! lodgeit.vim
	"http://www.vim.org/scripts/script.php?script_id=1965
	"http://paste.pocoo.org/help/integration/
	map <leader><leader><C-P> :Lodgeit<CR>
endif


"if has('python')
"python <<EOL
"import vim, StringIO,sys
"def PyExecReplace(line1,line2):
"	r = vim.current.buffer.range(int(line1),int(line2))
"	redirected = StringIO.StringIO()
"	sys.stdout = redirected
"	exec('\n'.join(r[:]) + '\n')
"	sys.stdout = sys.__stdout__
"	output = redirected.getvalue().split('\n')
"	r[:] = output[:-1] # the -1 is to remove the final blank line
"	redirected.close()
"
"
"def SetBreakpoint():
"    import re
"    nLine = int( vim.eval( 'line(".")'))
"
"    strLine = vim.current.line
"    strWhite = re.search( '^(\s*)', strLine).group(1)
"
"    vim.current.buffer.append( "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" %
"         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)
"
"    for strLine in vim.current.buffer:
"        if strLine == "import pdb":
"            break
"    else:
"        vim.current.buffer.append( 'import pdb', 0)
"        vim.command( 'normal j1')
"
"vim.command( 'map <f7> :py SetBreakpoint()<cr>')
"
"EOL
"command -range Pyer python PyExecReplace(<f-line1>,<f-line2>)
"endif


"from pprint import pprint; import IPython; IPython.Shell.IPShellEmbed(argv=[])()


fun! FixInvisiblePunctuation()
" taken from  https://github.com/alfredodeza/dotfiles/blob/master/.vimrc
" \%u2018\|\%u2019\|\%u2026\|\%uf0e0\|\%u0092\|\%u2013\|\%u2014\|\%u201C\|\%u201D\|\%u0052\%u20ac\%u2122\|\%ua0
    silent! %s/\%u2018/'/g
    silent! %s/\%u2019/'/g
    silent! %s/\%u2026/.../g
    silent! %s/\%uf0e0/->/g
    silent! %s/\%u0092/'/g
    silent! %s/\%u2013/--/g
    silent! %s/\%u2014/--/g
    silent! %s/\%u201C/"/g
    silent! %s/\%u201D/"/g
    silent! %s/\%u0052\%u20ac\%u2122/'/g
    silent! %s/\%ua0/ /g
    retab
endfun


" ========================
" experimental 

 function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>


" source $HOME/.vim/vimlog.vim





" ===================================================================

"command Pyflakes :call Pyflakes()
"function! Pyflakes()
"    let tmpfile = tempname()
"    execute "w" tmpfile
"    execute "set makeprg=(pyflakes\\ " . tmpfile . "\\\\\\|sed\\ s@" . tmpfile ."@%@)"
"    make
"    cw
"endfunction

" ===================================================================

" nmap <silent> <Leader>ml :call ModelineStub()<CR>
"  
" function! ModelineStub()
"     "inserts '/* vim: set ft=vim ts=4 sw=4 tw=0 et:*/' at the bottom of the file
" 
"     let save_cursor = getpos('.')
"     let fmt = ' vim: set ft=%s ts=%d sw=%d tw=%d %s:'
"  
"     let x = printf(&cms, printf(fmt, &ft, &ts, &sw, &tw, (&et?"et":"noet")))
"     $put =substitute(substitute(x, '\ \+', ' ', 'g'), ' $', '', '')
"     call setpos('.', save_cursor)
" endfunction

" ===================================================================

" let g:esc_filename_chars = ' *?[{`$%#"|!<>();&' . "'\t\n"
" function! Stu_escape(fname)
"     return escape(a:fname, g:esc_filename_chars)
" endfunction

" ===================================================================

" source $HOME/.vim/pycol.vim
" runtime! pycol.vim
" runtime! syntax/diff.vim
" runtime! syntax/pmenu.vim

" temporary hack...
" source $HOME/.vim/syntax/diff.vim

if $TERM =~ 'italic$'
    highlight Comment cterm=italic
endif

set guifont=Menlo\ Regular:h16
highlight Comment gui=italic

