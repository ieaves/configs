#!/bin/bash

# Assumes zplug was brew installed
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "plugins/git", from:oh-my-zsh, defer:3
zplug "zsh-users/zsh-completions"
zplug "fabiogibson/envrc-zsh-plugin"
zplug "zsh-users/zsh-autosuggestions", defer:3
zplug "zdharma/fast-syntax-highlighting", from:github, defer:2 # faster syntax highlighting

zplug "aperezdc/zsh-fzy" # fuzzy search plugin
zplug "b4b4r07/enhancd", use:"init.sh" # improved cd command
#zplug "plugins/autojump", from:oh-my-zsh, defer:3
zplug "skywind3000/z.lua"

zplug 'wfxr/forgit', defer:1 # git helper

zplug "CorradoRossi/oh-my-zsh-atom-plugin", defer:3
zplug "bckim92/zsh-autoswitch-conda", defer:3
zplug "MichaelAquilina/zsh-autoswitch-virtualenv"

zplug "vladmrnv/statify", defer:3 # provides the calc math command

zplug "rummik/zsh-tailf" # handles whitespace tab completions

zplug "zsh-users/zsh-history-substring-search"
zplug romkatv/powerlevel10k, as:theme, depth:1

zplug "MichaelAquilina/zsh-autoswitch-virtualenv"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
