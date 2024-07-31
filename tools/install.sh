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
brew_cask_install_check obsidian
brew_cask_install_check mark-text
brew_cask_install_check speedcrunch
brew_cask_install_check proxy-audio-device

# Setup Konfig
kubectl krew install konfig

# pipx installation & setup
brew_install_check pipx
#pipx ensurepath

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

INSTALL_VERSIONS=("3.8.16" "3.9.6" "3.10.1" "3.11.1")
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


# Python general Utils
# pip3 install -U pip
# pip3_install_check psutil

# Poetry
optional_install poetry "pipx install poetry"

# IDEs
brew_cask_install_check visual-studio-code
brew_cask_install_check pycharm

# Zsh & Associated
optional_install zsh

folder_install_check ~/.oh-my-zsh 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"' "oh-my-zsh already installed"

# Nerdfont Complete
brew tap homebrew/cask-fonts
brew_cask_install_check font-hack-nerd-font
brew_cask_install_check font-shure-tech-mono-nerd-font
brew_cask_install_check font-meslo-lg-nerd-font

## No longer need this as it's been moved to zplug
# Powerlevel10k
#brew_install_check romkatv/powerlevel10k/powerlevel10k

# Folder Based general utils
optional_install Node
optional_install ranger
optional_install fzy
optional_install Java


# Setup global gitignore
echo "Setting up global gitignore"
cp $SCRIPTPATH/../git/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Setup condarc
echo "Setting up conda condrc"
cp $SCRIPTPATH/../conda/condarc ~/.condarc

# Vim prep
optional_install vim
brew_install_check neovim


# fzy fuzzy search
if ! type fzf &> /dev/null;
then
  echo 'Installing fzf'
  brew install fzf
  $(brew --prefix)/opt/fzf/install
else
  echo "fzy fuzzy search already installed"
fi


# diff-so-fancy
if ! type diff-so-fancy &> /dev/null;
then
  echo 'Installing diff-so-fancy'
  brew install diff-so-fancy
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
  git config --global color.ui true

  git config --global color.diff-highlight.oldNormal    "red bold"
  git config --global color.diff-highlight.oldHighlight "red bold 52"
  git config --global color.diff-highlight.newNormal    "green bold"
  git config --global color.diff-highlight.newHighlight "green bold 22"

  git config --global color.diff.meta       "yellow"
  git config --global color.diff.frag       "magenta bold"
  git config --global color.diff.commit     "yellow bold"
  git config --global color.diff.old        "red bold"
  git config --global color.diff.new        "green bold"
  git config --global color.diff.whitespace "red reverse"
else
  echo "diff-so-fancy already installed"
fi


# apache-spark
brew tap homebrew/cask-versions
brew_install_check apache-spark

# Conda
if [ ! -d "$(expandPath ~/miniconda)" ] && [ ! -d "$(expandPath ~/anaconda)" ];
then
  echo "Installing conda"

  OSNAME="$(uname -s)"
  if [[ "$OSNAME" == 'Darwin' ]]; then
    OSNAME='MacOSX'
  fi

  wget "https://repo.anaconda.com/miniconda/Miniconda3-latest-$OSNAME-x86_64.sh" -O ~/miniconda.sh
  bash ~/miniconda.sh -b -p ~/miniconda
  rm ~/miniconda.sh

  # Install mamba faster alternative
  conda install mamba -n base -c conda-forge
else
  echo "Conda already installed"
fi


# Postman
brew_cask_install_check postman

# R Installation
optional_install r
brew_cask_install_check rstudio


# Julia Installation
optional_install julia


# Docker
optional_install docker

# Code Completions
poetry completions zsh > ~/.zfunc/_poetry


# Cleanup
brew cleanup
brew doctor
