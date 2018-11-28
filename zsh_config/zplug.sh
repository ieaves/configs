#!/bin/bash

# Assumes zplug was brew installed
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "plugins/git", from:oh-my-zsh, defer:3

zplug "zsh-users/zsh-autosuggestions", defer:3
zplug "zdharma/fast-syntax-highlighting" # faster syntax highlighting

zplug "aperezdc/zsh-fzy" # fuzzy search plugin
zplug "b4b4r07/enhancd", use:"init.sh" # improved cd command
zplug "plugins/autojump", from:oh-my-zsh, defer:3

zplug 'wfxr/forgit', defer:1 # git helper

zplug "CorradoRossi/oh-my-zsh-atom-plugin", defer:3
zplug "bckim92/zsh-autoswitch-conda", defer:3

zplug "vladmrnv/statify", defer:3 # provides the calc math command

zplug "paulmelnikow/zsh-startup-timer"
zplug "rummik/zsh-tailf" # handles whitespace tab completions

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
