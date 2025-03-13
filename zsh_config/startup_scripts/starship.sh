#!/bin/bash

export STARSHIP_CONFIG=$CONFIG_DIR/../starship/starship.toml
eval "$(starship init zsh)"
unset tooling_starship_config