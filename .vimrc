set nocompatible

if $TERM =~ '^screen' && exists("+ttymouse") && &ttymouse == ''
    set ttymouse=xterm
endif

"http://rayninfo.co.uk/vimtips.html
"show lines matching word under cursor <cword> (super)
"[I
"load VIM without .vimrc and plugins (clean VIM)
"gvim -u NONE -U NONE -N


filetype plugin indent on
syntax on

highlight StatusLine ctermfg=blue ctermbg=yellow
highlight Directory  ctermfg=red


fun! ModelTown()
	let fmt = 'ft=%s ts=%d sw=%d %s'
	let x = printf(fmt, &ft, &ts, &sw, (&et?"et":"noet"))
	return x
endf

fun! SynTown()
	let x = synIDattr(synID(line('.'),col('.'),1),'name')
	return x
endf

set statusline=%m\ %-f%=\ \ \ \ %{SynTown()}\ %{ModelTown()}\ %([%l:%c\:%02p%%]%)

set ignorecase
set smartcase

set mouse=a

set tabstop=3     
set shiftwidth=3  
set laststatus=2

set highlight=l:Visual 
set scrolloff=5
set number
set numberwidth=1
set nowrap	
set autoindent	
set cmdwinheight=15
set wildmenu

set isfname-==  " removed '=' since we don't want that ruining our autocomplete

set whichwrap=b,s,h,l
set viminfo='50,<1000,s100,:100,n~/.viminfo

let mapleader = ","

map <Leader>3 :s/\t/\r/g<Enter>
map <Leader>4 :s/\|/\r/g<Enter>
map <Leader>5 :s/,/\r/g<Enter>

map <Leader>d :diffthis<Return><C-W><C-W>:diffthis<Return>
map <Leader>o :diffoff<Return><C-W><C-W>:diffoff<Return>:set nowrap<Return>

map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>


if has('python')
	runtime! lodgeit.vim
	"http://www.vim.org/scripts/script.php?script_id=1965
	"http://paste.pocoo.org/help/integration/
	map <C-P> :Lodgeit<CR>
endif


vmap < <gv
vmap > >gv

vmap <C-c> :w! ~/.vbuf<CR>
nmap <C-c> :.w! ~/.vbuf<CR>
nmap <C-v> :r ~/.vbuf<CR>

nnoremap ' `
nnoremap ` '

"make scrolling faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-l> <C-W>l
map <C-N> <C-W>w


imap [3~ .


:au BufNewFile,BufRead,BufEnter *.dat set noet
:au BufNewFile,BufRead,BufEnter *.txt set noet
:au BufNewFile,BufRead,BufEnter *.sh  set et

runtime! ftplugin/man.vim
source $HOME/.vim/pycol.vim
"runtime! pycol.vim
"runtime! syntax/diff.vim
"runtime! syntax/pmenu.vim


if has('python')
python <<EOL
import vim, StringIO,sys
def PyExecReplace(line1,line2):
	r = vim.current.buffer.range(int(line1),int(line2))
	redirected = StringIO.StringIO()
	sys.stdout = redirected
	exec('\n'.join(r[:]) + '\n')
	sys.stdout = sys.__stdout__
	output = redirected.getvalue().split('\n')
	r[:] = output[:-1] # the -1 is to remove the final blank line
	redirected.close()
EOL
command -range Pyer python PyExecReplace(<f-line1>,<f-line2>)
endif


"command Pyflakes :call Pyflakes()
"function! Pyflakes()
"    let tmpfile = tempname()
"    execute "w" tmpfile
"    execute "set makeprg=(pyflakes\\ " . tmpfile . "\\\\\\|sed\\ s@" . tmpfile ."@%@)"
"    make
"    cw
"endfunction


" http://vim.wikia.com/wiki/Handy_option_flag_toggler
function IncrementOpt(option,min,inc,max)
  exec ('let tz_value = (((&'.a:option.'-'.a:min.')+'.a:inc.')%(('.a:max.'-'.a:min.')+'.a:inc.'))+'.a:min)
  if (tz_value > a:max || tz_value < a:min) " in case inc<0
    let tz_value = a:max
  endif
  exec ('setlocal '.a:option.'='.tz_value)
endfunction

noremap <silent> <F10> :call IncrementOpt("tabstop",2,-2,500)<BAR>set tabstop?<CR>
noremap <silent> <F11> :call IncrementOpt("tabstop",2,2,500)<BAR>set tabstop?<CR>
imap <F10> <C-O><F10>
imap <F11> <C-O><F11>

fun! ModelTown()
	let fmt = 'ft=%s ts=%d sw=%d %s'
	let x = printf(fmt, &ft, &ts, &sw, (&et?"et":"noet"))
	return x
endf


nmap <silent> <Leader>ml :call ModelineStub()<CR>
 
function! ModelineStub()
    let save_cursor = getpos('.')
    let fmt = ' vim: set ft=%s ts=%d sw=%d tw=%d %s:'
 
    let x = printf(&cms, printf(fmt, &ft, &ts, &sw, &tw, (&et?"et":"noet")))
    $put =substitute(substitute(x, '\ \+', ' ', 'g'), ' $', '', '')
    call setpos('.', save_cursor)
endfunction





cmap W!! %!sudo tee > /dev/null %

:command! -bar -count CS :%!cut -f<count> | sort -u

function! Insert(token)
   exec "r !awk -vpattern=" . a:token . " -f ~/.vim/templates/awk.awk ~/.vim/templates/template.txt"
endfunction

function! Graph()
   exec ":! ~/.vim/graph.sh %"
endfunction

:command! -n=* Graph           :call Graph()

:command! -n=* Inpt            :call Insert("inpt")
:command! -n=* Parms           :call Insert("parms")
:command! -n=* Directory       :call Insert("directory")
:command! -n=* Alias           :call Insert("alias")
:command! -n=* Execrows        :call Insert("execrows")
:command! -n=* List            :call Insert("list")
:command! -n=* ColTrace        :call Insert("coltrace")
:command! -n=* Trace           :call Insert("trace")
:command! -n=* Split           :call Insert("split")
:command! -n=* Filter          :call Insert("filter")
:command! -n=* Output          :call Insert("output")
:command! -n=* Brackets        :call Insert("brackets")
:command! -n=* Sort            :call Insert("sort")
:command! -n=* Squash          :call Insert("squash")
:command! -n=* Break           :call Insert("break")
:command! -n=* Multijoin       :call Insert("multijoin")
:command! -n=* Join            :call Insert("join")
:command! -n=* Lookup          :call Insert("lookup")
:command! -n=* Concat          :call Insert("concat")
:command! -n=* Rotate          :call Insert("rotate")
:command! -n=* Unrotate        :call Insert("unrotate")
:command! -n=* Expand          :call Insert("expand")
:command! -n=* Calc            :call Insert("calc")
:command! -n=* If              :call Insert("if")
:command! -n=* Rpad            :call Insert("rpad")
:command! -n=* Scan            :call Insert("scan")
:command! -n=* Translate       :call Insert("translate")
:command! -n=* Regexp          :call Insert("regexp")
:command! -n=* Regexpvalue     :call Insert("regexp_value")
:command! -n=* Today           :call Insert("today")
:command! -n=* Formatdate      :call Insert("format_date")
:command! -n=* Formatdaterange :call Insert("format_date_range")
:command! -n=* Datevalue       :call Insert("date_value")
:command! -n=* Column          :call Insert("column")
:command! -n=* Update          :call Insert("update")
:command! -n=* Persistent      :call Insert("persistent")
:command! -n=* Formatdatevalue :call Insert("format_date_value")
:command! -n=* Julianday       :call Insert("julian_day")
:command! -n=* Age             :call Insert("age")
:command! -n=* Rownum          :call Insert("row_num")
:command! -n=* YearMon         :call Insert("year_mon")
:command! -n=* Template        :call Insert("template")
:command! -n=* Builder         :call Insert("builder")
