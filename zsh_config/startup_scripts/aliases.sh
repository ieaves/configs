#!/bin/bash

#These two fix a startup issue with zsh-autoswitch-virtualenv
alias python=python3
alias pip=pip3
alias k=kubectl
#alias destroy="conda remove --all -n"
#alias create="conda create python=3.8 -n"
#alias polynote="~/polynote/polynote.py"
#alias deactivate="source deactivate"
alias ls=exa
alias cat=bat

if [ "$(uname -s)" = "Linux" ];
then 
    alias pycharm="pycharm-community $@ </dev/null &>/dev/null &"
    alias pbcopy='xclip -selection clipboard'
else
    alias pycharm='open -a /Applications/PyCharm.app'

    # as per https://github.com/pyenv/pyenv/issues/106
    alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
    alias readlink='greadlink'
fi

alias merge_kubeconfig

