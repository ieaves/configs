#!/bin/bash

cd $CONFIG_DIR

# Theming has to come before zsh_setup
source ./theming.sh
source ./zsh_setup.sh
source ./aliases.sh
source ./tools.sh
