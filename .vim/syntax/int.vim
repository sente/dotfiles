


syntax match tag        /\(column.*\)\@<=\(".*"\)/
syntax match label      /\(\'\a\a\a\a\'.*\)\@<=\(".*"\)/
syntax match statement  /\(input.*\)\@<=\(".*"\)/
syntax match calc_str   /\(calc_str.*\)\@<=\(".*"\)/
syntax match comment    /\/\/.*$/

syntax match blocks     /\c^\s*#IF.*$/
syntax match blocks     /\c^\s*#ENDIF.*$/
syntax match blocks     /\c^\s*#ELSE.*$/


hi blocks     ctermfg=red

hi comment    ctermfg=cyan
hi label      ctermfg=blue
hi tag        ctermfg=yellow
hi statement  ctermfg=red
hi StatusLine ctermfg=blue ctermbg=yellow
