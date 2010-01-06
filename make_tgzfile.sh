
function make_tgzfile() {
	if [ -f dotfiles.tgz ]; then
		mv -f dotfiles.tgz dotfiles.old.tgz || return 1
	fi

	git-ls-files | while read line; do
	if [ -f $HOME/$line ]; then
		echo $line;
	fi;
	done | xargs tar cvzf dotfiles.tgz
   echo "dotfiles.tgz created"
}

make_tgzfile
