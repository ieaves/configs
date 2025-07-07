[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Auto-activate and deactivate virtualenvs when moving directories

_auto_venv_chpwd() {
  # The parent directory of the active venv
  local venv_dir="${VIRTUAL_ENV%/*}"

  # Only deactivate if we're leaving the venv tree entirely
  if [[ -n "$VIRTUAL_ENV" && "$PWD" != "$venv_dir"* ]]; then
    echo "Deactivating virtualenv: $(basename "$venv_dir")"
    deactivate 2>/dev/null || unset VIRTUAL_ENV
  fi

  # Activate a new venv if there's a .venv in the current directory
  if [[ -f ".venv/bin/activate" && "$VIRTUAL_ENV" != "$PWD/.venv" ]]; then
    if [[ -n "$VIRTUAL_ENV" ]]; then
      echo "Switching virtualenv: $(basename "$venv_dir") → $(basename "$PWD")"
      deactivate 2>/dev/null || unset VIRTUAL_ENV
    else
      echo "Activating virtualenv: $(basename "$PWD")"
    fi
    source ".venv/bin/activate"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _auto_venv_chpwd