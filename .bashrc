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

if [ -f ~/.bash/wrappers.sh ]; then
      . ~/.bash/wrappers.sh
fi

if [ -f ~/.bashrc_local ]; then
      . ~/.bashrc_local
fi

if [ -d "${HOME}/bin" ]; then
    PATH="${PATH}:${HOME}/bin"
fi



function getdotfiles ()
{
    if [ -x $(which curl) ]; then
        curl http://github.com/sente/dotfiles/raw/master/.bash/gitdotfiles.sh | sh 
    elif [ -x $(which wget) ]; then
        wget -q -O - http://github.com/sente/dotfiles/raw/master/.bash/gitdotfiles.sh | sh 
    fi
}


stty stop  undef
stty start undef

export EDITOR=vim # for crontab -e
export VISUAL=vim # for crontab -e

export LANG=en_US.UTF-8
export TERM=xterm-256color

export PYTHONPATH=${HOME}/code/lib
export PYTHONSTARTUP=${HOME}/.pythonrc

export LESS="-iMXRS#10"
export GREP_OPTIONS="--color=auto"


unset HISTFILESIZE

export HISTSIZE=10000
export HISTCONTROL=ignoredups:ignorespace
shopt -s histappend




# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Don't try to find all the command possibilities when hitting TAB on an empty line.
shopt -s no_empty_cmd_completion


function exitstatus {

    EXITSTATUS="$?"
    local NONE="\[\033[0m\]"     # unsets color to term's fg color

    # regular colors
    local K="\[\033[0;30m\]"     # black
    local R="\[\033[0;31m\]"     # red
    local G="\[\033[0;32m\]"     # green
    local Y="\[\033[0;33m\]"     # yellow
    local B="\[\033[0;34m\]"     # blue
    local M="\[\033[0;35m\]"     # magenta
    local C="\[\033[0;36m\]"     # cyan
    local W="\[\033[0;37m\]"     # white

    # empahsized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"

    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"

    local RED="\[\033[1;31m\]"
    local GREEN="\[\033[32;1m\]"
    local BLUE="\[\033[34;1m\]"
    local OFF="\[\033[m\]"


    local UC=$NONE              # user's color
    [ $UID -eq "0" ] && UC=$R   # root's color


    if [[ $PWD != "$(readlink -m "$PWD")" ]]; then
         if [ "${EXITSTATUS}" -eq 0 ]
                then PS1="${UC}[${BLUE}\u${GREEN}@${BLUE}\h ${EMK}\w${UC}]${UC}\\$ ${NONE}"
                else PS1="${EMR}[${EMR}\u${GREEN}@${EMR}\h ${EMK}\w${EMR}]${UC}\\$ ${NONE}"
         fi
    else
         if [ "${EXITSTATUS}" -eq 0 ]
                then PS1="${GREEN}\u${OFF}${BLUE}@${OFF}${GREEN}\h \w${OFF} ${BLUE}\$${OFF} "
                else PS1="${RED}\u${OFF}${BLUE}@${OFF}${RED}\h \w${OFF} ${RED}\$${OFF} "
         fi
    fi

    echo -ne "\033k\033\\"
}


test -d ${HOME}/logs/history || echo "warning: ${HOME}/logs/history/ does not exist" >&2

function log_hist_command
{
    echo -e "$(date +%F.%H:%M:%S)\t${PWD}\t$(tail -n1 ${HOME}/.bash_history)" >> "${HOME}/logs/history/$(date +%F).log"
}

PROMPT_COMMAND="exitstatus && history -a && history 1 >> \"${HOME}/logs/bash_history\" && log_hist_command"


#PROMPT_COMMAND="exitstatus && history -a && log_hist_command"
#PROMPT_COMMAND="exitstatus && history -a && history 1 >> ${HOME}/logs/bash_history"

# vim: set ft=sh ts=4 sws=4 sw=4:
