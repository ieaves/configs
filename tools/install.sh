#!/bin/bash

BASEDIR=$(dirname "$(readlink -f "$0")")

. $BASEDIR/utilities.sh

# Setting up homebrew
optional_install brew 'bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

echo "Updating Homebrew"
cd $BASEDIR/../brew && brew bundle && cd ${BASEDIR}

# General tools
optional_install htop

# Setup Konfig
krew_install_check konfig

# Realpath (installed from coreutils)
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# Pyenv
optional_install pyenv

eval "$(pyenv init -)"
folder_install_check ~/.pyenv/versions "mkdir ~/.pyenv/versions" "pyenv versions already provisioned"

INSTALL_VERSIONS=("3.9.6" "3.10.1" "3.11.1" "3.12.1" "3.13.1")
INSTALLED_VERSIONS=$(pyenv versions)

for ver in "${INSTALL_VERSIONS[@]}"
do
    if ! echo "$INSTALLED_VERSIONS" | grep -q ${ver} ; then
        pyenv install ${ver}
    else
        echo "pyenv python ${ver} already installed"
    fi
done
unset INSTALL_VERSIONS INSTALLED_VERSIONS


# Poetry
optional_install poetry "pipx install poetry"

# IDEs
if [ -d "/Applications/Visual Studio Code.app" ]; then
  echo "Visual Studio already installed."
else
  brew_cask_install_check visual-studio-code
fi

# Zsh & Associated
optional_install zsh

folder_install_check ~/.oh-my-zsh 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"' "oh-my-zsh already installed"

# Nerdfont Complete
brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | brew_cask_install_check
# brew_cask_install_check font-shure-tech-mono-nerd-font
# brew_cask_install_check font-meslo-lg-nerd-font


# Folder Based general utils
optional_install Node
optional_install ranger
optional_install fzy
optional_install Java


# Vim prep
optional_install vim

# R Installation
optional_install r
# Docker
optional_install docker

# Setup global gitignore
echo "Setting up global gitignore"
cp $BASEDIR/../git/gitignore_global ~/.gitignore_global

# Configure git global settings
bash ${BASEDIR}/git_settings.sh
