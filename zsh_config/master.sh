#!/bin/bash

export $(cat ${CONFIG_DIR}/settings.txt | xargs)

PROFILE=${PROFILE:-false}


if $PROFILE; then
  zmodload zsh/zprof
fi

autoload -Uz +X compinit promptinit
promptinit
compinit


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
export POWERLEVEL9K_INSTANT_PROMPT=verbose
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -z ${USERNAME+x} ]; then
  USERNAME=$USER;
fi

# Theming has to come before zsh_setup
BOOT_SCRIPTS_DIR=$CONFIG_DIR/startup_scripts


# source $BOOT_SCRIPTS_DIR/theming_10k.sh
source $BOOT_SCRIPTS_DIR/env_setup.sh
source $BOOT_SCRIPTS_DIR/starship.sh
source $BOOT_SCRIPTS_DIR/aliases.sh
source $BOOT_SCRIPTS_DIR/utilities.sh

source $BOOT_SCRIPTS_DIR/antidote.sh
source $BOOT_SCRIPTS_DIR/post_zsh_setup.sh


unset BOOT_SCRIPTS_DIR

eval "$(pyenv init --path)"

if $PROFILE; then
  zprof
fi

