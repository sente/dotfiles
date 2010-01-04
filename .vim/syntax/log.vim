


"syntax match tag        /\(FAILED.*\)\@<=\(".*"\)/
"syntax match label      /\(\'\a\a\a\a\'.*\)\@<=\(".*"\)/
"syntax match calc_str   /\(calc_str.*\)\@<=\(".*"\)/
syntax match info /Duplicate value/
syntax match info /Duplicate values/

syntax match admin 	/\(di_admin.*\t\)/
syntax match admin	/\(di\/admin.*\t\)/

syntax match script	/\t\(\S\+.int\)/
syntax match script	/\t\(\S\+.dsc\)/

syntax match options /\s-\a\s/
syntax match attributes	/\S\+=\S\+/



"syntax match file
"syntax match scriptabs /Reading \/.*\.\.\.$/hs=s+8,he=e-3
"syntax match scriptnonabs /Reading [^\/].*\.\.\.$/hs=s+8,he=e-3

syntax match scriptabs /Reading \//hs=s+0,he=e-2
syntax match scriptnonabs /Reading [^\/]/hs=s+0,he=e-2

syntax match task /Starting task [^\.]\+/hs=s+14
syntax match task /Finished task [^\.]\+/hs=s+14

syntax match warning /Warning:/

syntax match written /^.*written to.*$/

"syntax match parm		/\s\+ .*/


hi written ctermfg=green
hi warning ctermfg=red

hi scriptabs	  ctermfg=cyan
hi scriptnonabs	  ctermfg=blue
hi task	  ctermfg=red

hi info		  ctermfg=blue
hi info		  ctermfg=yellow
hi fail		  ctermfg=black
hi fail		  ctermbg=red
hi reading		  ctermbg=red
hi admin		  ctermfg=cyan
hi script	  ctermfg=blue
hi attributes	  ctermfg=red
hi parm	  ctermfg=blue
hi options ctermfg=yellow
"
"hi StatusLine ctermfg=blue ctermbg=yellow
