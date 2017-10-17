# Shell is non-interactive.  Be done now!

if [[ $- != *i* ]] ; then
    return
fi

export login_email=stuart.powers@gmail.com
export PERL_LWP_SSL_VERIFY_HOSTNAME=0


if [ -d "${HOME}/bin" ]; then
    PATH="${PATH}:${HOME}/bin"
fi

if [ -d "${HOME}/bin" ]; then
    PATH="${PATH}:${HOME}/.local/bin"
fi

if [[ -d "/usr/local/opt/coreutils/libexec/gnubin" ]]; then
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi

if [[ -d "/usr/local/opt/gnu-sed/libexec/gnubin" ]]; then
    PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
fi

if [[ -d "${HOME}/go" ]]; then
    GOPATH="${HOME}/go"
    export GOPATH
    PATH=$PATH:${GOPATH}/bin
fi


export _is_osx=0
export _is_nix=0

case "$OSTYPE" in
  darwin*)  _is_osx=1 ;; 
  linux*)   _is_nix=1 ;;
esac


get_os()
{
    declare -r OS_NAME="$(uname -s)";
    local os="";
    if [ "$OS_NAME" == "Darwin" ]; then
        os="osx";
    else
        if [ "$OS_NAME" == "Linux" ] && [ -e "/etc/lsb-release" ]; then
            os="ubuntu";
        fi;
    fi;
    printf "%s" "$os"
}


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
  if [ -x "`which dircolors`" ]; then
    eval $(dircolors -b ~/.dir_colors)
  fi
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

GLOBIGNORE=".:.."
shopt -u dotglob


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
    echo -E "$(date +%F.%H:%M:%S)"$'\t'"${PWD}"$'\t'"$(tail -n1 ${HOME}/.bash_history)" >> "${HOME}/logs/history/$(date +%F).log"
    #echo -e "$(date +%F.%H:%M:%S)\t${PWD}\t$(tail -n1 ${HOME}/.bash_history)" >> "${HOME}/logs/history/$(date +%F).log"
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


#if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
#    export WORKON_HOME=$HOME/.environments
#    source /usr/local/bin/virtualenvwrapper.sh
#fi

export HOMEBREW_GITHUB_API_TOKEN=e2d8840751a435b2545ca474a7696c1c8db0ac43
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# vim: set ft=sh ts=4 sws=4 sw=4:

# added by travis gem
[ -f /Users/stu/.travis/travis.sh ] && source /Users/stu/.travis/travis.sh




#   https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md

NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"




export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH="/Users/stu/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/stu/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/stu/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/stu/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/stu/perl5"; export PERL_MM_OPT;
