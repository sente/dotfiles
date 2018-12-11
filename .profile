

if [ -f ${HOME}/.bashrc ]; then
    source ${HOME}/.bashrc
fi


#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# source ~/.rvm/scripts/rvm
if [ -f /usr/local/bin/setup_completeme_key_binding.sh ]; then
    source /usr/local/bin/setup_completeme_key_binding.sh
fi

export PATH="$HOME/.cargo/bin:$PATH"
