#!/bin/bash

SCRIPT_PATH=`greadlink -f ${BASH_SOURCE[0]} || readlink -f ${BASH_SOURCE[0]}`
DIR=$(dirname $SCRIPT_PATH)

mkdir -p ~/.config/kitty
cp $DIR/kitty.conf ~/.config/kitty/kitty.conf