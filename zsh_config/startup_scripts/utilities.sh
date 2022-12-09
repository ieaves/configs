#!/bin/bash

profile_zsh(){
    export PROFILE=true
    source ~/.zshrc
}

settings(){
    KEY=$1
    VALUE=$2
    sed -i '' -e "s/${1}=.*/${1}=${2}/g" ${CONFIG_DIR}/settings.txt
}