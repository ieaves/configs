[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh", "uname": "'$(uname)'" }}\x9c'