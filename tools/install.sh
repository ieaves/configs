brew tap homebrew/cask-fonts

#ZSH zplug
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

# Realpath
echo "Installing realpath"
brew tap iveney/mocha
brew install realpath

# MDLT, math utility
echo "Installing MDLT"
npm i -g mdlt

# Setup global gitignore
echo "Setting up global gitignore"
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
cp $SCRIPTPATH/../git/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
