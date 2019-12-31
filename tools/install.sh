# Setting up homebrew

if ! type brew &> /dev/null; then
  echo "Installing Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating Homebrew"
brew update && brew upgrade

echo "Getting Homebrew fonts"
brew tap homebrew/cask-fonts

# Clone powerlevel9k into oh-my-zsh
echo "Installing powerlevel9k"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Powerline
echo "Installing powerline"
brew install coreutils
pip3 install powerline-status

# Nerdfont Complete
echo "Installing Nerd Fonts"
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
brew cask install font-sharetechmono-nerd-font

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

# Node
echo "Installing Node + npm"
brew install Node

# Nativefier
echo "Installing Nativefier"
brew install nativefier

# Asana
if ! test /Applications/asana-*.app; then
    echo "Nativefie Asana"
    nativefier --name "asana" "https://app.asana.com"
    mv asana-* /Applications
fi


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

# autojump
echo 'Installing autojump'
brew install autojump

# fzy fuzzy search
echo 'Installing fzy'
brew install fzy

# fzy fuzzy search
echo 'Installing fzf'
brew install fzf
$(brew --prefix)/opt/fzf/install

# diff-so-fancy
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

echo "Installing pyenv"
brew install pyenv
pyenv install 3.7.0
pyenv install 3.8.0

echo "Installing psutil"
pip3 install psutil

echo "installing spark"
brew install apache-spark

echo "Installing Polynote"
# Doesn't currently work, installation can't find jep for some reason
curl -s https://api.github.com/repos/polynote/polynote/releases/latest \
    | grep "polynote-dist.tar.gz" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -qi -

tar -zxvpf polynote-dist.tar.gz
rm polynote-dist.tar.gz
mv polynote ~/polynote

pip3 install jep jedi pyspark virtualenv


echo "Installing HTTPie"
brew install httpie
