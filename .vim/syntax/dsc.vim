


syntax match comment    /\/\/.*$/

syntax match blocks     /\c^\s*#IF.*$/
syntax match blocks     /\c^\s*#ENDIF.*$/
syntax match blocks     /\c^\s*#ELSE.*$/

syntax keyword blocks dimensions
syntax keyword blocks info
syntax keyword blocks calcs
syntax keyword blocks string
syntax keyword blocks dimcounts
syntax keyword blocks sum_types
syntax keyword blocks summary
syntax keyword blocks sort
syntax keyword blocks dates
syntax keyword blocks formats
syntax keyword blocks date_range


syntax keyword attr starname
syntax keyword attr output
syntax keyword attr journal
syntax keyword attr bucket_dir
syntax keyword attr squash
syntax keyword attr dictionary
syntax keyword attr aliases
syntax keyword attr bf
syntax keyword attr bf_minimum
syntax keyword attr bf_maximum
syntax keyword attr skip_build
syntax keyword attr skip_block_factor
syntax keyword attr ws 
syntax keyword attr dump_key
syntax keyword attr journal_append
syntax keyword attr bucket_dir

syntax keyword attr aliases

syntax keyword attr block_factor
syntax keyword attr require_permit_version
syntax keyword attr delimiter
syntax keyword attr column_headers
syntax keyword attr input

syntax keyword attr remove_on_fail

syntax keyword attr ignore_line_end
syntax keyword attr ignore_quotes
syntax keyword attr encoding
syntax keyword attr first
syntax keyword attr lookup_model
syntax keyword attr parse_only


syntax keyword attr detail_dimensions
syntax keyword attr detail_summary
syntax keyword attr detail_info

syntax keyword nameval name value

syntax keyword ERROR jounral 


"highlight link xERROR ERROR
"highlight link blocks Type
"highlight link attributes Statement


hi blocks     ctermfg=red
hi nameval    ctermfg=blue
hi attr       ctermfg=yellow

hi comment    ctermfg=cyan
hi label      ctermfg=blue
hi tag        ctermfg=yellow
hi statement  ctermfg=red
hi StatusLine ctermfg=blue ctermbg=yellow
