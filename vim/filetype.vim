" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect

  au! BufRead,BufNewFile *.int		setfiletype int
  au! BufRead,BufNewFile *.dsc		setfiletype dsc
  au! BufRead,BufNewFile *.mrk		setfiletype mrk
  au! BufRead,BufNewFile *.dvp		setfiletype dvp 
  au! BufRead,BufNewFile integ_all_commands.log		setfiletype cmd_log
  au! BufRead,BufNewFile builder_all_commands.log	setfiletype cmd_log
  
  au! BufRead,BufNewFile integ_2*.log		setfiletype log
  au! BufRead,BufNewFile builder_2*.log	setfiletype log

  au! BufRead,BufNewFile *.mine		setfiletype mine
  au! BufRead,BufNewFile *.xyz		setfiletype drawing
  au! BufRead,BufNewFile *.mrc		setfiletype mhonarc

  au! BufRead,BufNewFile *.py		setfiletype python


augroup END
