#! /bin/bash
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then 
    eval "$(pyenv virtualenv-init -)"; 
fi

#. <(flux completion zsh) 

