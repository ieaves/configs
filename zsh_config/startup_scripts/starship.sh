#!/bin/bash

export STARSHIP_CONFIG=~/.config/starship.toml
tooling_starhip_config=$CONFIG_DIR/../starship/starship.toml

if [ ! -e ${STARSHIP_CONFIG} ] || [ ${tooling_starhip_config} -nt ${STARSHIP_CONFIG} ]; then
    cp ${tooling_starhip_config} ${STARSHIP_CONFIG}
fi

eval "$(starship init zsh)"
unset tooling_starship_config