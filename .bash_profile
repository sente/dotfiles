

if [ -x "`which keychain`" ]; then
    keychain --quiet ~/.ssh/id_rsa
    if [ -f ~/.keychain/sente.cc-sh ]; then
          . ~/.keychain/sente.cc-sh > /dev/null
    fi
fi

if [ -f ~/.keychain/sente-csh ]; then
     rm ~/.keychain/sente-csh
fi


# include .bashrc if it exists
if [ -f "${HOME}/.bashrc" ]; then
      . "${HOME}/.bashrc"
fi

# Load RVM into a shell session *as a function*
if [[ -f "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"
fi
