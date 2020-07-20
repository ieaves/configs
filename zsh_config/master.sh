#!/bin/bash
PROFILE=false

if $PROFILE; then
  zmodload zsh/zprof
fi

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

eval "$(pyenv init -)"

if [ -z ${POWERLINE_PYTHON+x} ]; then
  POWERLINE_PYTHON=$(which python3);
fi

if [ -z ${ANACONDA+x} ]; then
  if [ -d ~/anaconda3 ]; then
      ANACONDA=anaconda3
  elif [ -d ~/anaconda ]; then
      ANACONDA=anaconda
  else
      ANACONDA=miniconda
  fi
fi

if [ -z ${USERNAME+x} ]; then
  USERNAME=$USER;
fi


# Conda has to be prepared for zsh-autoswitch-conda
source $CONFIG_DIR/conda_prep.sh
# Theming has to come before zsh_setup
source $CONFIG_DIR/zplug.sh
#source $CONFIG_DIR/theming_9k.sh
source $CONFIG_DIR/theming_10k.sh


#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

source $CONFIG_DIR/aliases.sh
source $CONFIG_DIR/tools.sh
source $CONFIG_DIR/env_setup.sh

source $CONFIG_DIR/zsh_setup.sh

source $CONFIG_DIR/post_zsh_setup.sh

if $PROFILE; then
  zprof
fi
