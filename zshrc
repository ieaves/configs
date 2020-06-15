
if [ -d ~/anaconda3 ];
then
    ANACONDA=anaconda3
else
    ANACONDA=miniconda
fi
POWERLINE_PYTHON=python3.7

# Can reference current directory
CONFIG_DIR=/Users/$USER/repos/tooling/configs/zsh_config
source $CONFIG_DIR/master.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
