autoload -Uz +X compinit promptinit
promptinit
compinit

source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh

export STARSHIP_CONFIG=~/.config/.ian-zsh-config/starship.toml
eval "$(starship init zsh)"

# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh", "uname": "'$(uname)'" }}\x9c'
# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh"}}\x9c'