# Assumes zplug was brew installed
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "Tarrasch/zsh-autoenv"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "vladmrnv/statify"
zplug "CorradoRossi/oh-my-zsh-atom-plugin"
zplug "plugins/git",   from:oh-my-zsh
zplug "bckim92/zsh-autoswitch-conda"
zplug "zsh-users/zsh-completions"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
