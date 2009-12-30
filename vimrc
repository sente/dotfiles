set nocompatible

if $TERM =~ '^screen' && exists("+ttymouse") && &ttymouse == ''
    set ttymouse=xterm
endif


filetype plugin indent on
syntax on

highlight StatusLine ctermfg=blue ctermbg=yellow
highlight Directory  ctermfg=red

set laststatus=2	" 2->Always. Always show the status
set statusline=%m\ %-f%=\ \ \ \ %([%l:%c\:%02p%%]%)

set ignorecase
set smartcase


set mouse=a

set tabstop=3     
set shiftwidth=3  

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

"browse for files within the current file's directory
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>


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


python << EOL
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





"let $HSLASH=$HOME . "/"
"let $SRCFILE=$HSLASH . ".vim/pycol.vim"
"if file_readable($SRCFILE)
"	source $SRCFILE
"endif
"let $SRCFILE=$HSLASH . ".vim/syntax/diff.vim"
"if file_readable($SRCFILE)
"	source $SRCFILE
"endif


"Will allow you to use :w!! to write to a file
"using sudo if you forgot to "sudo vim file" 
"Why not just ":w !sudo tee %"? 
"http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks
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
