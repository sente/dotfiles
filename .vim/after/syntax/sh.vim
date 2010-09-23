

syn region shCommandSub matchgroup=shStuCommand start="\$(" end=")" contains=@shCommandSubList
high shStuCommand ctermfg=white
