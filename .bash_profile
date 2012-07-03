# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

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
