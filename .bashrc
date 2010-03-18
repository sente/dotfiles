# Shell is non-interactive.  Be done now!
if [[ $- != *i* ]] ; then
    return
fi

if [[ -s ~/.motd ]] ; then
     cat ~/.motd
fi

if [ -f ~/.bash/aliases ]; then
	   . ~/.bash/aliases
fi

if [ -f ~/.bash/functions ]; then
      . ~/.bash/functions
fi

if [ -f ~/.bash/jail ]; then
      . ~/.bash/jail
fi

if [ -f ~/.bash/extras.sh ]; then
      . ~/.bash/extras.sh
fi

if [ -f ~/.bash/setlogic ]; then
      . ~/.bash/setlogic
fi

if [ -f ~/.dir_colors ]; then
	eval $(dircolors -b ~/.dir_colors)
fi

if [ -d "${HOME}/bin" ]; then
	PATH="${PATH}:${HOME}/bin"
fi


export PATH


stty stop  undef
stty start undef

shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Don't try to find all the command possibilities when hitting TAB on an empty line.
shopt -s no_empty_cmd_completion


#for breaks on castle
if [ -f ${HOME}/.bash/bash_completion ]; then
      . ${HOME}/.bash/bash_completion
fi

#if [ -f /etc/bash_completion ]; then
#      . /etc/bash_completion
#fi

#lots of random useful stuff
#http://www.pixelbeat.org/cmdline.html


function _list_paths {
	echo -e "${PATH//:/\n}";
}


export LANG=en_US.UTF-8

export BOLD="\[\033[1m\]"
export RED="\[\033[1;31m\]"
export GREEN="\[\033[32;1m\]"
export BLUE="\[\033[34;1m\]"
export OFF="\[\033[m\]"

export GREP_OPTIONS="--color=auto"
export HISTCONTROL=ignoredups:ignorespace
export HISTFILESIZE=10000
export HISTTIMEFORMAT='%F %R.%M%t'
export HISTIGNORE="history *:"
export PYTHONPATH=${HOME}/code/lib

#http://blog.gnist.org/article.php?story=BashPromptWithExitStatus
function exitstatus {
	EXITSTATUS="$?"
	if [ "${EXITSTATUS}" -eq 0 ]
		then PS1="${GREEN}\u${OFF}${BLUE}@${OFF}${GREEN}\h \w${OFF} ${BLUE}\$${OFF} "
		else PS1="${RED}\u${OFF}${BLUE}@${OFF}${RED}\h \w${OFF} ${RED}\$${OFF} "
	fi
	echo -ne "\033k\033\\"
}
#TODO move .bash_full elsewhere and log the exit statuses
PROMPT_COMMAND="exitstatus && history -a && history 1 >> ~/.bash_full"

#ignore this

#complete -A setopt set
#complete -A user groups id
#complete -A binding bind
#complete -A helptopic help
#complete -A alias {,un}alias
#complete -A signal -P '-' kill
#complete -A stopped -P '%' fg bg
#complete -A job -P '%' jobs disown
#complete -A variable readonly unset
#complete -A file -A directory ln chmod
#complete -A user -A hostname finger pinky
#complete -A directory find cd pushd {mk,rm}dir
#complete -A file -A directory -A user chown
#complete -A file -A directory -A group chgrp
#complete -A command man which whatis whereis sudo info apropos
