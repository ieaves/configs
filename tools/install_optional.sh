#!/bin/bash

BASEDIR=$(dirname "$0")

. $BASEDIR/utilities.sh

brew_cask_install_check spotify
brew_cask_install_check zoom

brew_cask_install_check macdown
brew_cask_install_check pycharm
folder_install_check /Applications/Slack.app "brew install --cask slack"


# Asana
if ! test /Applications/asana-*.app; then
    echo "Nativefie Asana"
    nativefier --name "asana" "https://app.asana.com"
    mv asana-* /Applications
fi


