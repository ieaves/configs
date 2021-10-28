#!/bin/bash

SCRIPT_PATH=`greadlink -f ${BASH_SOURCE[0]} || readlink -f ${BASH_SOURCE[0]}`
DIR=$(dirname $SCRIPT_PATH)
ZSH_FILE=$DIR/../zsh_config/zshrc

if [ -f $HOME/.zshrc ];
then
  mv $HOME/.zshrc $HOME/.zshrc.bak
fi

touch $HOME/.zshrc
echo "source $ZSH_FILE" >> $HOME/.zshrc