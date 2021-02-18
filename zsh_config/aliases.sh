#!/bin/bash

alias python=python3
#alias ranger='ranger --datadir=~/repos/tooling/ranger'
alias math='mdlt'
alias run="make -f '~/.runner/Makefile'"
alias destroy="conda remove --all -n"
alias create="conda create python=3.8 -n"
alias polynote="~/polynote/polynote.py"
if [ "$(uname -s)" = "Linux" ];
then 
    alias pycharm="pycharm-community $@ </dev/null &>/dev/null &"
    alias pbcopy='xclip -selection clipboard'
else
    alias pycharm='open -a /Applications/PyCharm\ CE.app'
fi

