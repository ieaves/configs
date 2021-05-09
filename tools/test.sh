#!/bin/bash

BASEDIR=$(dirname "$0")

. $BASEDIR/utilities.sh

if [[ $(command -v brew) == "" ]]; then
    echo "Installing brew"
   # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "brew already installed"
fi