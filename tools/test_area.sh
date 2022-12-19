#!/bin/bash

BASEDIR=$(dirname "$0")

. $BASEDIR/utilities.sh
POETRY_PATH="${POETRY_HOME:-"$HOME/Library/Application\ Support/pypoetry"}"
echo $POETRY_PATH
folder_install_check "${POETRY_HOME:-$HOME/Library/Application\ Support/pypoetry}" "curl -sSL https://install.python-poetry.org | python3 -" "poetry already installed"

# VAR='~/Library/Application\ Support/pypoetry'
# echo "$VAR" | sed 's/\\//g'
# FOLDER="${VAR/#\~/$HOME}"
# echo $FOLDER
# FOLDER=`greadlink -m "$FOLDER"`
# echo $FOLDER
# #VAR="/Users/ian/repos"
# VAR="${VAR/#\~/$HOME}"

# FOLDER=$(greadlink -m "$VAR")
# echo $FOLDER

# echo "starting"
# VAR=~/Library/Application\ Support/pypoetry
# if [ "$(uname -s)" = "Linux" ];
# then 
#     FOLDER=`echo "$VAR" | xargs -I {} readlink -m {}`
# else
#     FOLDER=`echo "$VAR" | xargs -I {} greadlink -m {}`
# fi
# echo $FOLDER
# # ELSE_MESSAGE=${3:-"$FOLDER already exists"}
# # if [ ! -e "$FOLDER" ]; then
# #     echo "Executing '$COMMAND'"
# # else
# #     echo "$ELSE_MESSAGE"
# # fi

# echo "starting 2"
# VAR='~/Library/Application\ Support/pypoetry'
# FOLDER=`cd / && echo "$VAR" | xargs -I {} grealpath -m {}`

# echo 1, $VAR
# echo 2, $FOLDER
