#!/bin/bash

BASEDIR=$(dirname "$0")

. $BASEDIR/utilities.sh

# Setting up homebrew
optional_install brew 'bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh -c"'

echo "Updating Homebrew"
brew update && brew upgrade

# General tools
optional_install htop
brew_install_check httpie
brew_install_check curl
brew_install_check wget
brew_install_check coreutils
brew_install_check gcc
brew_install_check pwgen
brew_install_check ripgrep
brew_install_check zplug
brew_install_check antidote
brew_install_check virtualenv
brew_install_check openblas
brew_install_check lapack
brew_install_check geos
brew_install_check kubectl
brew_install_check krew
brew_install_check fortune
brew_install_check eza
brew_install_check uv
brew_install_check antidote
brew_cask_install_check obsidian
brew_cask_install_check mark-text
brew_cask_install_check proxy-audio-device

# Setup Konfig
krew_install_check konfig

# pipx installation & setup
brew_install_check pipx


# Realpath (installed from coreutils)
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# Pyenv
optional_install pyenv
brew_install_check readline
brew_install_check xz
brew_install_check pyenv-virtualenv

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

brew_cask_install_check pycharm

# Zsh & Associated
optional_install zsh

folder_install_check ~/.oh-my-zsh 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"' "oh-my-zsh already installed"

# Nerdfont Complete
brew_cask_install_check font-hack-nerd-font
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
brew_install_check neovim

# diff-so-fancy
brew_install_check diff-so-fancy

# apache-spark
brew_install_check apache-spark

# Postman
brew_cask_install_check postman

# R Installation
optional_install r
brew_cask_install_check rstudio


# Julia Installation
brew_install_check julia


# Rust Installation
brew_install_check rust

# Docker
optional_install docker

# Setup global gitignore
echo "Setting up global gitignore"
cp $SCRIPTPATH/../git/gitignore_global ~/.gitignore_global

# Configure git global settings
bash ${BASEDIR}/git_settings.sh

# Cleanup
brew cleanup
brew doctor
