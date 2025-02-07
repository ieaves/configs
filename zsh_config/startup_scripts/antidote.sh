#!/bin/bash

config_plugins_file=$CONFIG_DIR/plugins/antidote.plugins.sh
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins
zsh_plugins_file=${zsh_plugins}.txt

source ${BREW_PREFIX}/opt/antidote/share/antidote/antidote.zsh

if [ ! -e ${zsh_plugins_file} ] || [ ${config_plugins_file} -nt ${zsh_plugins_file} ]; then
    echo "Copying plugins file from ${config_plugins_file} to ${zsh_plugins_file}"
    cp ${config_plugins_file} ${zsh_plugins_file}
fi

antidote load

unset config_plugins_txt zsh_plugins