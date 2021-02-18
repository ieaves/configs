#!/bin/bash
BASEDIR=$(dirname "$0")
. $BASEDIR/../tools/utilities.sh


sudo apt install snapd
sudo snap install snap-store

# Installs linuxbrew 
sudo apt-get install build-essential

optional_install brew 'sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | /bin/bash'

if ! grep -q 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' /home/ian/.profile;
then
  echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/ian/.profile
fi
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)


sudo apt install wine64 winbind winetricks
sudo apt install xclip xsel

# SpaceVim
#sudo apt-get install vim -y
#curl -sLf https://spacevim.org/install.sh | bash

#sudo apt install curl git-core gcc make zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libssl-dev
#sudo apt-get install libffi-dev
#curl https://pyenv.run | bash

#export PATH="/home/ian/.pyenv/bin:$PATH"
#status --is-interactive; and pyenv init - | source
#status --is-interactive; and pyenv virtualenv-init - | source

#pyenv install 3.6.0  
#pyenv install 3.7.0  
#pyenv install 3.8.0
#pyenv install 3.9.0