

if [ -x "`which keychain`" ]; then
    keychain --quiet ~/.ssh/id_rsa
    if [ -f ~/.keychain/sente.cc-sh ]; then
          . ~/.keychain/sente.cc-sh > /dev/null
    fi
fi


if [ -f ~/.keychain/sente.cc-csh ]; then
     rm ~/.keychain/sente.cc-csh
fi


# include .bashrc if it exists
if [ -f "${HOME}/.bashrc" ]; then
      . "${HOME}/.bashrc"
fi
