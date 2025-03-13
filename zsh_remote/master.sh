autoload -Uz +X compinit promptinit
promptinit
compinit

config_plugins_file=$CONFIG_DIR/plugins/antidote.plugins.sh
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins
zsh_plugins_file=${zsh_plugins}.txt

source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh

if [ ! -e ${zsh_plugins_file} ] || [ ${config_plugins_file} -nt ${zsh_plugins_file} ]; then
    echo "Copying plugins file from ${config_plugins_file} to ${zsh_plugins_file}"
    cp ${config_plugins_file} ${zsh_plugins_file}
fi
antidote load


export STARSHIP_CONFIG=~/.config/.ian-zsh-config/starship.toml
eval "$(starship init zsh)"

# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh", "uname": "'$(uname)'" }}\x9c'
# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh"}}\x9c'