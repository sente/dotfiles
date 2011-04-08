" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect



  au! StdinReadPost * 
  \ if getline(1) =~ '\(integ\|builder\|i\|b\)_\d\d\d\d\d\d\d.*log' |
  \    setfiletype cmd_log |
  \    set path^=/di/logs/commands | 
  \ endif


  au! BufRead,BufNewFile *.das      setfiletype das
  au! BufRead,BufNewFile *.int      setfiletype int
  au! BufRead,BufNewFile *.dsc      setfiletype dsc
  au! BufRead,BufNewFile *.mrk      setfiletype mrk
  au! BufRead,BufNewFile *.dvp      setfiletype dvp 


  au! BufRead,BufNewFile integ_all_commands.log     setfiletype cmd_log
  au! BufRead,BufNewFile builder_all_commands.log   setfiletype cmd_log

  au! BufRead,BufNewFile integ_2*.log   setfiletype log
  au! BufRead,BufNewFile builder_2*.log setfiletype log
  au! BufRead,BufNewFile i_2*.log       setfiletype log
  au! BufRead,BufNewFile b_2*.log       setfiletype log



  au! BufNewFile,BufRead *.sh,*/.bash/*,   setfiletype sh
  au! BufNewFile,BufRead *.rb,*.erb,*.rake setfiletype ruby
  au! BufNewFile,BufRead *.pl              setfiletype perl

  au! FileType perl  setlocal ai et sta sw=4 sts=4
  au! FileType sh    setlocal ai et sta sw=4 sts=4 ts=4
"  au! FileType sh    let b:comtown='#'
"  au! FileType int   let b:comtown='//'
  au! FileType ruby  setlocal ai et sta sw=2 sts=2 ts=2



  au! BufNewFile,BufRead  *.html set et sw=4 sts=4 ai sta

  au! BufNewFile,BufRead  *.dat set noet
  au! BufNewFile,BufRead  *.txt set noet

  au! BufRead,BufNewFile *.mine     setfiletype mine
  au! BufRead,BufNewFile *.xyz      setfiletype drawing
  au! BufRead,BufNewFile *.mrc      setfiletype mhonarc

  au! BufRead,BufNewFile *.py,*.rpy setfiletype python
  au! BufRead,BufNewFile *.snip     setfiletype snip

augroup END
" vim: set et ts=4 sw=4:
