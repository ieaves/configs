brew tap homebrew/cask-fonts     

# ZSH syntax highlighting
echo "Installing zsh syntax highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
mv zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

# ZSH autosuggestions
echo "Installing zsh autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions
mv zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

# ZSH statify
echo "Installing zsh statify"
git clone https://github.com/vladmrnv/statify
mv statify ~/.oh-my-zsh/plugins/statify

# ZSH atom
echo "Installing zsh oh-my-zsh-atom-plugin"
git clone https://github.com/CorradoRossi/oh-my-zsh-atom-plugin
mv oh-my-zsh-atom-plugin ~/.oh-my-zsh/plugins/oh-my-zsh-atom-plugin

# ZSH clean project
echo "Installing zsh oh-my-zsh-atom-plugin"
git clone https://github.com/wwilsman/zsh-clean-project
mv zsh-clean-project ~/.oh-my-zsh/plugins/zsh-clean-project

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
