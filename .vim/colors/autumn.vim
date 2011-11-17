"   " vim color file
"   "  maintainer: tiza
"   " last change: 2002/10/14 mon 16:41.
"   "     version: 1.0
"   " this color scheme uses a light background.
"   
"   set background=light
"   hi clear
"   if exists("syntax_on")
"      syntax reset
"   endif
"   
"   let colors_name = "autumn"
"   
"   hi normal       guifg=#404040 guibg=#fff4e8
"   
"   " search
"   hi incsearch    gui=underline guifg=#404040 guibg=#e0e040
"   hi search       gui=none guifg=#544060 guibg=#f0c0ff
"   
"   " messages
"   hi errormsg     gui=bold guifg=#f8f8f8 guibg=#4040ff
"   hi warningmsg   gui=bold guifg=#f8f8f8 guibg=#4040ff
"   hi modemsg      gui=none guifg=#d06000 guibg=none
"   hi moremsg      gui=none guifg=#0090a0 guibg=none
"   hi question     gui=none guifg=#8000ff guibg=none
"   
"   " split area
"   hi statusline   gui=bold guifg=#f8f8f8 guibg=#904838
"   hi statuslinenc gui=bold guifg=#c0b0a0 guibg=#904838
"   hi vertsplit    gui=none guifg=#f8f8f8 guibg=#904838
"   hi wildmenu     gui=bold guifg=#f8f8f8 guibg=#ff3030
"   
"   " diff
"   hi difftext     gui=none guifg=#2850a0 guibg=#c0d0f0
"   hi diffchange   gui=none guifg=#208040 guibg=#c0f0d0
"   hi diffdelete   gui=none guifg=#ff2020 guibg=#eaf2b0
"   hi diffadd      gui=none guifg=#ff2020 guibg=#eaf2b0
"   
"   " cursor
"   hi cursor       gui=none guifg=#ffffff guibg=#0080f0
"   hi lcursor      gui=none guifg=#ffffff guibg=#8040ff
"   hi cursorim     gui=none guifg=#ffffff guibg=#8040ff
"   
"   " fold
"   hi folded       gui=none guifg=#804030 guibg=#ffc0a0
"   hi foldcolumn   gui=none guifg=#a05040 guibg=#f8d8c4
"   
"   " other
"   hi directory    gui=none guifg=#7050ff guibg=none
"   hi linenr       gui=none guifg=#e0b090 guibg=none
"   hi nontext      gui=bold guifg=#a05040 guibg=#ffe4d4
"   hi specialkey   gui=none guifg=#0080ff guibg=none
"   hi title        gui=bold guifg=fg      guibg=none
"   hi visual       gui=none guifg=#804020 guibg=#ffc0a0
"   " hi visualnos  gui=none guifg=#604040 guibg=#e8dddd
"   
"   " syntax group
"   hi comment      gui=none guifg=#ff5050 guibg=none
"   hi constant     gui=none guifg=#00884c guibg=none
"   hi error        gui=bold guifg=#f8f8f8 guibg=#4040ff
"   hi identifier   gui=none guifg=#b07800 guibg=none
"   hi ignore       gui=none guifg=bg guibg=none
"   hi preproc      gui=none guifg=#0090a0 guibg=none
"   hi special      gui=none guifg=#8040f0 guibg=none
"   hi statement    gui=bold guifg=#80a030 guibg=none
"   hi todo         gui=bold,underline guifg=#0080f0 guibg=none
"   hi type         gui=bold guifg=#b06c58 guibg=none
"   hi underlined   gui=underline guifg=blue guibg=none
