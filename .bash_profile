

if [ -x "`which keychain`" ]; then
    if [ -f ~/.ssh/id_rsa ]; then
        keychain --quiet ~/.ssh/id_rsa
        if [ -f ~/.keychain/sente.cc-sh ]; then
              . ~/.keychain/sente.cc-sh > /dev/null
        fi
    fi
fi


if [ -f "${HOME}/.bashrc" ]; then
      . "${HOME}/.bashrc"
fi

export PATH="/usr/local/sbin:$PATH"

if [[ $_is_osx -eq 1 ]]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

if [ -x "$(which rbenv)" ]; then
   export PATH="$HOME/.rbenv/bin:$PATH"
   eval "$(rbenv init -)"
fi

#source /Users/stu/.rvm/scripts/rvm
if [ -d "${HOME}/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
