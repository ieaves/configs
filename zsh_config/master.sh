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


source $CONFIG_DIR/aliases.sh

# Theming has to come before zsh_setup
source $CONFIG_DIR/theming.sh

# Conda has to be prepated for zsh-autoswitch-conda
source $CONFIG_DIR/conda_prep.sh
source $CONFIG_DIR/tools.sh

source $CONFIG_DIR/zplug.sh
source $CONFIG_DIR/zsh_setup.sh

source $CONFIG_DIR/post_zsh_setup.sh

if $PROFILE; then
  zprof
fi
