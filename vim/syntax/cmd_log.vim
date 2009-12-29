


"syntax match tag        /\(FAILED.*\)\@<=\(".*"\)/
"syntax match label      /\(\'\a\a\a\a\'.*\)\@<=\(".*"\)/
"syntax match calc_str   /\(calc_str.*\)\@<=\(".*"\)/
syntax match fail		/\t\(FAILED\)\(\t\)\@=/

syntax match admin 	/\(di_admin.*\t\)/
syntax match admin	/\(di\/admin.*\t\)/

syntax match script	/\t\(\S\+.int\)/
syntax match script	/\t\(\S\+.dsc\)/

syntax match options /\s-\a\s/
syntax match attributes	/\S\+=\S\+/



"syntax match parm		/\s\+ .*/


"
"hi comment    ctermfg=cyan
"hi label      ctermfg=blue
"hi tag        ctermfg=yellow
hi fail		  ctermfg=black
hi fail		  ctermbg=red
hi admin		  ctermfg=cyan
hi script	  ctermfg=blue
hi attributes	  ctermfg=red
hi parm	  ctermfg=blue
hi options ctermfg=yellow
"
"hi StatusLine ctermfg=blue ctermbg=yellow
