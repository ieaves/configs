optional_install(){
    APPLICATION=$1
    COMMAND=${2:-"brew install $APPLICATION"}
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
    if brew info $APPLICATION  | grep "Not installed" &>/dev/null;
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
    if brew cask info $APPLICATION  | grep "Not installed" &>/dev/null;
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
    FOLDER="$(expandPath $1)"
    COMMAND=$2 #(expandPath $2)
    ELSE_MESSAGE=${3:-"$FOLDER already exists"}
    if [ ! -e "$FOLDER" ]; then
        echo "Executing '$COMMAND'"
        eval "$COMMAND"
    else
        echo "$ELSE_MESSAGE"
    fi
}

