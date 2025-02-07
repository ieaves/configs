#!/bin/bash

antidote_dir=${ZDOTDIR:-~}/.antidote
config_plugins_txt=$CONFIG_DIR/plugins/antidote.plugins.sh
plugins_txt=${ZDOTDIR:-~}/.zsh_plugins.txt
static_file=${antidote_dir}/.zsh_plugins.zsh

if [[ ! -d $antidote_dir ]]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git $antidote_dir
fi

source $antidote_dir/antidote.zsh


# compares the two files to see if they've changed
if [[ ! $plugins_txt -nt $config_plugins_txt ]]; then
    rm $plugins_txt
    cp ${config_plugins_txt} ${plugins_txt}
    antidote bundle < $plugins_txt > $static_file   
fi

source $static_file 
unset antidote_dir plugins_txt static_file config_plugins_txt

