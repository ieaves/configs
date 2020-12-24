BASEDIR=$(dirname "$0")

. $BASEDIR/utilities.sh

# Setting up homebrew
optional_install brew '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'

echo "Updating Homebrew"
git -C /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core fetch --unshallow
git -C /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask fetch --unshallow
brew update && brew upgrade

# General tools
optional_install htop
brew_install_check httpie
brew_install_check wget
brew_install_check timewarrior
brew_install_check coreutils

# Task Warrior
brew_install_check task

# Realpath
brew tap iveney/mocha
optional_install realpath

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

optional_install pyenv
brew_install_check readline
brew_install_check xz
brew_install_check pyenv-virtualenv

eval "$(pyenv init -)"
folder_install_check '~/.pyenv/versions' "pyenv versions already provisioned"

folder_install_check '~/.pyenv/versions/3.7.0' 'pyenv install 3.7.0 -s' "pyenv python 3.7.0 already installed"
folder_install_check '~/.pyenv/versions/3.8.0' 'pyenv install 3.8.0 -s' "pyenv python 3.8.0 already installed"
folder_install_check '~/.pyenv/versions/3.9.0b3' 'pyenv install 3.9.0 -s' "pyenv python 3.9.0b3 already installed"

DEFAULT_PYTHON=3.7.0
pyenv global $DEFAULT_PYTHON

pip3_install_check psutil


# IDEs
brew_cask_install_check visual-studio-code
optional_install atom "brew install --cask atom"
brew_cask_install_check pycharm

# Zsh & Associated
optional_install zsh

folder_install_check ~/.oh-my-zsh 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"' "oh-my-zsh already installed"

# Nerdfont Complete
brew tap homebrew/cask-fonts
brew_cask_install_check font-hack-nerd-font
brew_cask_install_check font-sharetechmono-nerd-font


# Installing & Setting up Powerlevle 9k / 10k
brew tap sambadevi/powerlevel9k
brew_install_check powerlevel9k
Clone powerlevel9k into oh-my-zsh
if [ ! -d "$(expandPath ~/.oh-my-zsh/custom/themes/powerlevel9k)" ];
then
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
else
  echo "powerlevel 9k already prepared for oh-my-zsh"
fi

brew_install_check romkatv/powerlevel10k/powerlevel10k
# Clone powerlevel9k into oh-my-zsh
FOLDER="$(expandPath ~/.oh-my-zsh/custom/themes/powerlevel10k)"
if [ ! -d "$FOLDER" ];
then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
else
  echo "powerlevel 10k already prepared for oh-my-zsh"
fi


# ZSH zplug
brew_install_check zplug

# Slack
folder_install_check /Applications/Slack.app "brew install --cask slack"
#brew_cask_install_check slack

# ranger
optional_install ranger

# ripgrep
brew_install_check ripgrep

# Node
optional_install Node

# Nativefier
optional_install nativefier

# Asana
if ! test /Applications/asana-*.app; then
    echo "Nativefie Asana"
    nativefier --name "asana" "https://app.asana.com"
    mv asana-* /Applications
fi


# Setup global gitignore
echo "Setting up global gitignore"
cp $SCRIPTPATH/../git/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Setup condarc
echo "Setting up conda condrc"
cp $SCRIPTPATH/../conda/condarc ~/.condarc

# SpaceVim
optional_install vim
folder_install_check '~/.SpaceVim' "curl -sLf https://spacevim.org/install.sh | bash" "pyenv versions already provisioned"

# autojump
optional_install autojump

# fzy fuzzy search
optional_install fzy

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


# Java
optional_install Java


# apache-spark
brew_cask_install_check homebrew/cask-versions/adoptopenjdk8
brew_install_check apache-spark


# Polynote
FOLDER="$(expandPath ~/polynote)"
if [ ! -e "$FOLDER" ]; then
  echo "Installing Polynote"
  pip3 install jep jedi pyspark virtualenv
  pip3_install_check jep
  pip3_install_check jedi
  pip3_install_check pyspark
  pip3_install_check virtualenv

  # Doesn't currently work, installation can't find jep for some reason
  curl -s https://api.github.com/repos/polynote/polynote/releases/latest \
      | grep "polynote-dist.tar.gz" \
      | cut -d : -f 2,3 \
      | tr -d \" \
      | wget -qi -

  tar -zxvpf polynote-dist.tar.gz
  rm polynote-dist.tar.gz
  if [ ! -e "$FOLDER" ]; then
      mv polynote ~/polynote
  fi
else
  echo "Polynote already installed"
fi


# Conda
if [ ! -d "$(expandPath ~/miniconda)" ] && [ ! -d "$(expandPath ~/anaconda)" ];
then
  echo "Installing conda"
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
  bash ~/miniconda.sh -b -p ~/miniconda
  rm ~/miniconda.sh
else
  echo "Conda already installed"
fi


# Postman
brew_cask_install_check postman


# R Installation
brew_install_check openblas
optional_install r
brew_cask_install_check rstudio


# Julia Installation
optional_install julia


# Virtualbox & Vagrant
optional_install virtualbox
optional_install vagrant
brew_cask_install_check vagrant-manager


# Docker
optional_install docker


# Minikube
optional_install minikube


# Campaudit error fix
compaudit | xargs chmod g-w


# Cleanup
brew cleanup
brew doctor
brew cask doctor
