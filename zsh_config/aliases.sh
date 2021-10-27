#!/bin/bash

alias python=python3
alias math='mdlt'
alias run="make -f '~/.runner/Makefile'"
alias destroy="conda remove --all -n"
alias create="conda create python=3.8 -n"
#alias polynote="~/polynote/polynote.py"
alias deactivate="source deactivate"

if [ "$(uname -s)" = "Linux" ];
then 
    alias pycharm="pycharm-community $@ </dev/null &>/dev/null &"
    alias pbcopy='xclip -selection clipboard'
else
    alias pycharm='open -a /Applications/PyCharm\ CE.app'

    # as per https://github.com/pyenv/pyenv/issues/106
    alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
    alias readlink='greadlink'
fi

