"highlight DiffAdd cterm=none ctermfg=bg ctermbg=Green 
"highlight DiffDelete cterm=none ctermfg=bg ctermbg=Red 
"highlight DiffChange cterm=none ctermfg=bg ctermbg=Yellow 
"highlight DiffText cterm=none ctermfg=bg ctermbg=Magenta 
highlight DiffAdd cterm=none ctermbg=Cyan
highlight DiffDelete cterm=none ctermbg=Cyan
highlight DiffChange cterm=none ctermbg=Blue
highlight DiffText cterm=none ctermfg=Black ctermbg=Yellow


function! Changecolorscheme()
    highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
    highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
    highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
    highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black 
endfunction


