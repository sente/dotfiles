" Syntax highlighting for snippet files (used for snipMate.vim)
" Hopefully this should make snippets a bit nicer to write!



"2010-03-16 22:59:35

"syntax match logDate /^\d\{4}-\d\{2}-\d\{2}/ containedin=logDateTimeTypeLine nextgroup=logTime skipwhite
"syntax match logTime /\d\{2}:\d\{2}:\d\{2}/ containedin=logDateTimeTypeLine,logTrace
syntax match logDate /^\d\{4}-\d\{2}-\d\{2}/ containedin=logDateTimeTypeLine
syntax match logTime /\d\{2}:\d\{2}:\d\{2}/ containedin=logDateTimeTypeLine
syntax match logDateTimeTypeLine /^\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}:\d\{2}.*/
syntax region logTrace matchgroup=logErrorStartLine start=/^\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}:\d\{2},\d\{3}.*ERROR.*/ms=s,rs=e+1 end=/^\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}:\d\{2},\d\{3}/me=s-1,he=s-1,re=s-1
hi link logTrace Error
hi link logDateTimeTypeLine Keyword
hi link logDate String
hi link logTime Comment
hi logErrorStartLine guifg=red
hi String ctermfg=blue
hi keyword ctermfg=red
hi comment ctermfg=green





syn region snipHeader start=+<header>+ end=+</header>+ keepend contains=snipDesc,snipTags
"syn match htmlItem +<[^>]*>+ contained


syn match snipDesc 'desc:\.*$' contained
syn match snipTags 'tags:\.*$' contained

hi link shipDesc String
hi link shipTags Comment

hi Comment    ctermfg=cyan
hi String     ctermfg=blue



"
"
"syn match snipComment '^#.*'
"syn match placeHolder '\${\d\+\(:.\{-}\)\=}' contains=snipCommand
"syn match tabStop '\$\d\+'
"syn match snipCommand '[^\\]`.\{-}`'
"syn match snippet '^snippet.*' transparent contains=multiSnipText,snipKeyword
"syn match multiSnipText '\S\+ \zs.*' contained
"syn match snipKeyword '^snippet'me=s+8 contained
"syn match snipError "^[^#s\t].*$"
"
"hi link snipComment   Comment
"hi link multiSnipText String
"hi link snipKeyword   Keyword
"hi link snipComment   Comment
"hi link placeHolder   Special
"hi link tabStop       Special
"hi link snipCommand   String
"hi link snipError     Error
"
"==> dsc.vim <==
"
"
"
"syntax match comment    /\/\/.*$/
"
"syntax match blocks     /\c^\s*#IF.*$/
"syntax match blocks     /\c^\s*#ENDIF.*$/
"syntax match blocks     /\c^\s*#ELSE.*$/
"
"syntax keyword blocks dimensions
"syntax keyword blocks info
"syntax keyword blocks calcs
"syntax keyword blocks string
"syntax keyword blocks dimcounts
"syntax keyword blocks sum_types
"syntax keyword blocks summary
"syntax keyword blocks sort
"syntax keyword blocks dates
"syntax keyword blocks formats
"syntax keyword blocks date_range
"
"
"syntax keyword attr starname
"syntax keyword attr output
"syntax keyword attr journal
"syntax keyword attr bucket_dir
"syntax keyword attr squash
"syntax keyword attr dictionary
"syntax keyword attr aliases
"syntax keyword attr bf
"syntax keyword attr bf_minimum
"syntax keyword attr bf_maximum
"syntax keyword attr skip_build
"syntax keyword attr skip_block_factor
"syntax keyword attr ws 
"syntax keyword attr dump_key
"syntax keyword attr journal_append
"syntax keyword attr bucket_dir
"
"syntax keyword attr aliases
"
"syntax keyword attr block_factor
"syntax keyword attr require_permit_version
"syntax keyword attr delimiter
"syntax keyword attr column_headers
"syntax keyword attr input
"
"syntax keyword attr remove_on_fail
"
"syntax keyword attr ignore_line_end
"syntax keyword attr ignore_quotes
"syntax keyword attr encoding
"syntax keyword attr first
"syntax keyword attr lookup_model
"syntax keyword attr parse_only
"
"
"syntax keyword attr detail_dimensions
"syntax keyword attr detail_summary
"syntax keyword attr detail_info
"
"syntax keyword nameval name value
"
"
""highlight link xERROR ERROR
""highlight link blocks Type
"highlight link attributes Statement
"
"
"hi blocks     ctermfg=red
"hi nameval    ctermfg=blue
"hi attr       ctermfg=yellow
"
"hi comment    ctermfg=cyan
"hi label      ctermfg=blue
"hi tag        ctermfg=yellow
"hi statement  ctermfg=red
"hi StatusLine ctermfg=blue ctermbg=yellow
