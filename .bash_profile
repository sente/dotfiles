

if [ -x "`which keychain`" ]; then
    if [ -f ~/.ssh/id_rsa ]; then
        keychain --quiet ~/.ssh/id_rsa
        if [ -f ~/.keychain/sente.cc-sh ]; then
              . ~/.keychain/sente.cc-sh > /dev/null
        fi
    fi
fi

if [ -f ~/.keychain/sente-csh ]; then
     rm ~/.keychain/sente-csh
fi

if [ -f "${HOME}/.bashrc" ]; then
      . "${HOME}/.bashrc"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


# # Load RVM into a shell session *as a function*
# if [ -s "${HOME}/.rvm/scripts/rvm" ]; then
#       . "${HOME}/.rvm/scripts/rvm"
# fi
export PATH="/usr/local/sbin:$PATH"
