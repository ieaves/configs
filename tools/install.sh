brew tap homebrew/cask-fonts

# Clone powerlevel9k into oh-my-zsh
echo "Installing powerlevel9k"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# ZSH zplug
echo "Installing zplug"
brew install zplug

# Math with Slack
echo "Installing math-with-slack"
curl -OL https://github.com/fsavje/math-with-slack/releases/download/v0.2.5/math-with-slack.sh
sudo bash math-with-slack.sh
rm math-with-slack.sh

# ranger
echo "Installing ranger"
brew install ranger

# ripgrep
echo "Installing rip-grep"
brew install ripgrep

# Realpath
echo "Installing realpath"
brew tap iveney/mocha
brew install realpath

# MDLT, math utility
echo "Installing MDLT"
npm i -g mdlt

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# Setup global gitignore
echo "Setting up global gitignore"
cp $SCRIPTPATH/../git/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Setup condarc
echo "Setting up conda condrc"
cp $SCRIPTPATH/../conda/condarc ~/.condarc

# SpaceVim
echo 'Installing SpaceVim'
brew install vim
curl -sLf https://spacevim.org/install.sh | bash
