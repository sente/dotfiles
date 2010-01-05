# Shell is non-interactive.  Be done now!
if [[ $- != *i* ]] ; then
    return
fi

if [[ -s ~/.motd ]] ; then
     cat ~/.motd
fi

stty stop  undef
stty start undef

shopt -s histappend
shopt -s checkwinsize


# COLUMNS is nowa ccessable from within scripts
export COLUMNS

if [ -f ~/.bash/aliases ]; then
	   . ~/.bash/aliases
fi

if [ -f ~/bash/functions ]; then
      . ~/bash/functions
fi

if [ -f ~/bin/helpers.sh ]; then
      . ~/bin/helpers.sh
fi

if [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
fi

eval $(dircolors -b ~/.dir_colors)


export IP=`echo $SSH_CLIENT | cut -f1 -d' '`
export LANG=en_US.UTF-8
export PATH=$PATH:~/bin

export BOLD="\[\033[1m\]"
export RED="\[\033[1;31m\]"
export GREEN="\[\e[32;1m\]"
export BLUE="\[\e[34;1m\]"
export OFF="\[\033[m\]"


export HISTCONTROL=ignoredups:ignorespace
export HISTFILESIZE=10000
export HISTTIMEFORMAT='%F %R.%M%t'
export HISTIGNORE="history *:"

#http://blog.gnist.org/article.php?story=BashPromptWithExitStatus
function exitstatus {
	EXITSTATUS="$?"
	if [ "${EXITSTATUS}" -eq 0 ]
		then PS1="${GREEN}\u${OFF}${BLUE}@${OFF}${GREEN}\h \w${OFF} ${BLUE}\$${OFF} "
		else PS1="${RED}\u${OFF}${BLUE}@${OFF}${RED}\h \w${OFF} ${BLUE}\$${OFF} "
	fi
}
PROMPT_COMMAND="exitstatus && history -a && history 1 >> ~/.bash_full"


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
