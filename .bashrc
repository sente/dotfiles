# Shell is non-interactive.  Be done now!

if [[ $- != *i* ]] ; then
    return
fi

if [ -d "${HOME}/bin" ]; then
    PATH="${PATH}:${HOME}/bin"
fi

if [[ -d "/usr/local/opt/coreutils/libexec/gnubin" ]]; then
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi

if [[ -d "/usr/local/opt/gnu-sed/libexec/gnubin" ]]; then
    PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
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

#if [ -f ~/.bash/wrappers.sh ]; then
#      . ~/.bash/wrappers.sh
#fi

if [ -f ~/.bashrc_local ]; then
      . ~/.bashrc_local
fi

stty stop  undef
stty start undef

export EDITOR=vim # for crontab -e
export VISUAL=vim # for crontab -e

export LANG=en_US.UTF-8
export TERM=xterm-256color

export PYTHONPATH=${HOME}/code/lib
export PYTHONSTARTUP=${HOME}/.pythonrc

export LESS="-iMXRS#10"
#export GREP_OPTIONS="--color=auto"

unset HISTFILESIZE

export HISTSIZE=1000000
export HISTCONTROL=ignoredups:ignorespace
export HISTIGNORE='*MDFIND*'
shopt -s histappend



# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Don't try to find all the command possibilities when hitting TAB on an empty line.
shopt -s no_empty_cmd_completion

function exitstatus {
    noop=1
}

test -d ${HOME}/logs/history || echo "warning: ${HOME}/logs/history/ does not exist" >&2

function log_hist_command
{
    echo -e "$(date +%F.%H:%M:%S)\t${PWD}\t$(tail -n1 ${HOME}/.bash_history)" >> "${HOME}/logs/history/$(date +%F).log"
}

PROMPT_COMMAND="exitstatus && history -a && history 1 >> \"${HOME}/logs/bash_history\" && log_hist_command"

if [ -f ${HOME}/.git-completion.sh ]; then
    source ${HOME}/.git-completion.sh;
fi

GREEN="\[\033[32;1m\]"
BLUE="\[\033[34;1m\]"
OFF="\[\033[m\]"

PS1="${GREEN}\u${OFF}${BLUE}@${OFF}${GREEN}\h \w${OFF}"' $(__git_ps1 "(%s) ")'"${BLUE}\$${OFF} "


git_diff ()
{
    git diff --no-ext-diff -w "$@" | vim -R -
}


if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.environments
    source /usr/local/bin/virtualenvwrapper.sh
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# vim: set ft=sh ts=4 sws=4 sw=4:
