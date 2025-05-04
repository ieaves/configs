#!/bin/bash

#These two fix a startup issue with zsh-autoswitch-virtualenv
alias python=python3
alias pip=pip3
alias k=kubectl
alias ls=eza
alias cat=bat
alias pycharm='open -a /Applications/PyCharm.app'
alias readlink='greadlink'
alias cursor='open -a /Applications/Cursor.app'

# as per https://github.com/pyenv/pyenv/issues/106
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'




