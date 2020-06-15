BASEDIR=$(dirname "$0")

. $BASEDIR/utilities.sh

# Setting up homebrew
echo "Installing Homebrew"
optional_install brew /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


echo "Updating Homebrew"
brew update && brew upgrade

# Realpath
echo "Installing realpath"
brew tap iveney/mocha
optional_install realpath

DEFAULT_PYTHON=3.7.0
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# IDEs
echo "Installing IDEs"
brew_cask_install_check visual-studio-code
optional_install atom "brew cask install atom"

# Zsh & Associated
echo "Installing zshell and Oh My Zsh"
optional_install zsh

folder_install_check ~/.oh-my-zsh "sh -c '$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)'"


# Clone powerlevel9k into oh-my-zsh
echo "Installing powerlevel9k"
if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel9k ];
then
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

# Powerline
echo "Installing powerline"
brew_install_check coreutils
pip3_install_check powerline-status

# Nerdfont Complete
echo "Installing Nerd Fonts"
brew tap homebrew/cask-fonts
brew_cask_install_check font-hack-nerd-font
brew_cask_install_check font-shuretechmono-nerd-font

# ZSH zplug
echo "Installing zplug"
brew_install_check zplug

# Slack
echo "Installing slack"
brew_cask_install_check slack

# Math with Slack
# Isn't working since slack 4.0 No updates yet but some possibility here: https://github.com/fsavje/math-with-slack/issues/51
echo "Installing math-with-slack"
#curl -OL https://github.com/fsavje/math-with-slack/releases/download/v0.2.5/math-with-slack.sh
#sudo bash math-with-slack.sh
#rm math-with-slack.sh

# ranger
echo "Installing ranger"
optional_install ranger

# ripgrep
echo "Installing rip-grep"
brew_install_check ripgrep

# Node
echo "Installing Node + npm"
optional_install Node

# Nativefier
echo "Installing Nativefier"
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
echo 'Installing SpaceVim'
optional_install vim
curl -sLf https://spacevim.org/install.sh | bash

# autojump
echo 'Installing autojump'
optional_install autojump

# fzy fuzzy search
echo 'Installing fzy'
optional_install fzy

# fzy fuzzy search
echo 'Installing fzf'
if ! type fzf &> /dev/null;
then
    brew install fzf
    $(brew --prefix)/opt/fzf/install
else
  echo "fzy fuzzy search already installed"
fi


# diff-so-fancy
echo 'Installing diff-so-fancy'
if ! type diff-so-fancy &> /dev/null;
then
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

echo "Installing pyenv"
optional_install pyenv

folder_install_check '~/.pyenv/versions/python3.7.0' 'pyenv install 3.7.0'
folder_install_check '~/.pyenv/versions/python3.8.0' 'pyenv install 3.8.0'
folder_install_check '~/.pyenv/versions/python3.9.0' 'pyenv install 3.9.0'

pyenv global $DEFAULT_PYTHON

echo "Installing psutil"
pip3_install_check psutil

echo "installing spark"
brew_install_check apache-spark

echo "Installing Java"
brew_cask_install_check Java

echo "Installing Polynote"
if [ ! -d ~/polynote ]
then
  #pip3 install jep jedi pyspark virtualenv
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
  if [ ! -d ~/polynote]
  then
    mv polynote ~/polynote
  fi
fi


echo "Installing HTTPie"
brew_install_check httpie

echo "Installing conda"
#wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
#bash ~/miniconda.sh -b -p $HOME/miniconda
