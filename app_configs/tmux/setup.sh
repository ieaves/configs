#!/bin/bash

SCRIPT_PATH=`greadlink -f ${BASH_SOURCE[0]} || readlink -f ${BASH_SOURCE[0]}`
DIR=$(dirname $SCRIPT_PATH)

cp $DIR/.tmux.conf ~/.tmux.conf