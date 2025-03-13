#!/bin/bash

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Script is executed, not sourced
    CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
else
    # Script is sourced
    CONFIG_DIR="$(cd "$(dirname "${0}")" && pwd)"
fi

export CONFIG_DIR=${CONFIG_DIR}
BOOT_SCRIPTS_DIR=$CONFIG_DIR/startup_scripts

# Sets environment variables
source ${CONFIG_DIR}/settings.env

if $PROFILE; then
  zmodload zsh/zprof
fi

# Loads zsh
autoload -Uz +X compinit promptinit
promptinit
compinit

# If enabling 10k remember to uncomment it in the antidote plugins
source $BOOT_SCRIPTS_DIR/starship.sh
# source $BOOT_SCRIPTS_DIR/theming_10k.sh


source $BOOT_SCRIPTS_DIR/startup_commands.sh
source $BOOT_SCRIPTS_DIR/aliases.sh
source $BOOT_SCRIPTS_DIR/utilities.sh
source $BOOT_SCRIPTS_DIR/antidote.sh
source $BOOT_SCRIPTS_DIR/post_startup_commands.sh
unset BOOT_SCRIPTS_DIR



if $PROFILE; then
  zprof
fi

