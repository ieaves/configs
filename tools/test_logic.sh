optional_install(){
    APPLICATION=$1
    COMMAND=${2:-"brew install $APPLICATION"}
    echo $COMMAND
    if ! type $APPLICATION &> /dev/null;
    then
        echo "Installing $APPLICATION"
        $COMMAND
    else
        echo "$APPLICATION already installed"
    fi
}

brew_install_check(){
    APPLICATION=$1
    COMMAND=${2:-"brew install $APPLICATION"}
    if ! brew info $APPLICATION &>/dev/null;
    then
        echo "Installing $APPLICATION"
        $COMMAND
    else
        echo "$APPLICATION already installed"
    fi
}

brew_cask_install_check(){
    APPLICATION=$1
    COMMAND=${2:-"brew cask install $APPLICATION"}
    if ! brew cask info $APPLICATION &>/dev/null;
    then
        echo "Installing $APPLICATION"
        $COMMAND
    else
        echo "$APPLICATION already installed"
    fi
}

pip3_install_check(){
    APPLICATION=$1
    COMMAND=${2:-"pip3 install $APPLICATION"}
    if ! pip3 show $APPLICATION &>/dev/null;
    then
        echo "pip3 installing $APPLICATION"
        $COMMAND
    else
        echo "$APPLICATION already installed by pip"
    fi
}


expandPath() {
  case $1 in
    ~[+-]*)
      local content content_q
      printf -v content_q '%q' "${1:2}"
      eval "content=${1:0:2}${content_q}"
      printf '%s\n' "$content"
      ;;
    ~*)
      local content content_q
      printf -v content_q '%q' "${1:1}"
      eval "content=~${content_q}"
      printf '%s\n' "$content"
      ;;
    *)
      printf '%s\n' "$1"
      ;;
  esac
}

folder_install_check(){
    FOLDER=`$1`
    COMMAND=$2
    echo "Working $FOLDER"
    if [ -d $folder ];
    then
        `$COMMAND`
    fi
}


folder_install_check ~/asdbasbfduas mkdir ~/asdbasbfduas
#curl -sLf https://spacevim.org/install.sh | bash -b -p $HOME/miniconda

#wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
##bash ~/miniconda.sh -b -p $HOME/miniconda

#bash <(curl -sLf https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh) -b -p $HOME/miniconda
#bash ~/miniconda.sh -b -p $HOME/miniconda
