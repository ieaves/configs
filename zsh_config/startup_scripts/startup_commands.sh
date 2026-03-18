# eval "$(pyenv init --path)"

_cache_eval() {
  local cache="$HOME/.cache/zsh/${1}.zsh"
  if [[ ! -f $cache ]] || [[ $(command -v $1) -nt $cache ]]; then
    mkdir -p "$HOME/.cache/zsh"
    "$@" > "$cache"
  fi
  source "$cache"
}

_cache_eval zoxide init zsh --cmd cd
_cache_eval fzf --zsh
