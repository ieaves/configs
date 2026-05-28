# eval "$(pyenv init --path)"

_cache_eval() {
  local cache="$HOME/.cache/zsh/${1}.zsh"
  if [[ ! -f $cache ]] || [[ $(command -v $1) -nt $cache ]]; then
    mkdir -p "$HOME/.cache/zsh"
    "$@" > "$cache"
    # fzf --zsh snapshots the full `options` array and restores it via eval.
    # zsh 5.9 errors on setopt `zle` from any non-startup context, so the
    # restore emits "(eval):1: can't change option: zle". Rewrite the snapshot
    # builder to drop zle from the restore string.
    if [[ $1 == fzf ]]; then
      sed -i.bak 's#"options=(${(j: :)${(kv)options\[@\]}})"#"options=(${${${(j: :)${(kv)options[@]}}// zle on/}// zle off/})"#g' "$cache" && rm -f "$cache.bak"
    fi
  fi
  source "$cache"
}

_cache_eval fzf --zsh
_cache_eval zoxide init zsh --cmd cd
