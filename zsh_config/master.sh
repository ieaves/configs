#!/bin/bash
export $(cat ${CONFIG_DIR}/settings.txt | xargs)

PROFILE=${PROFILE:-false}

if [ -d '/home/linuxbrew/.linuxbrew/bin/brew' ];
then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

if $PROFILE; then
  zmodload zsh/zprof
fi

autoload -Uz +X compinit promptinit

# suppressed errors here because stat fails on linux for some reason
# checks whether the current day of the year is different from the modification day of the year
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump &> /dev/null)&> /dev/null ]; then
  promptinit
  compinit
else
  promptinit -C
  compinit -C
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
export POWERLEVEL9K_INSTANT_PROMPT=verbose
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
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

# Theming has to come before zsh_setup
BOOT_SCRIPTS_DIR=$CONFIG_DIR/startup_scripts


source $BOOT_SCRIPTS_DIR/theming_10k.sh
source $BOOT_SCRIPTS_DIR/env_setup.sh
source $BOOT_SCRIPTS_DIR/aliases.sh
source $BOOT_SCRIPTS_DIR/utilities.sh

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then 
    eval "$(pyenv virtualenv-init -)"; 
fi

source $BOOT_SCRIPTS_DIR/antidote.sh
source $BOOT_SCRIPTS_DIR/post_zsh_setup.sh

unset BOOT_SCRIPTS_DIR

source <(kubectl completion zsh)
zstyle ':completion:*' menu select
fpath+=~/.zfunc


if $PROFILE; then
  zprof
fi
