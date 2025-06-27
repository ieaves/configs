[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Auto-activate and deactivate virtualenvs when moving directories

_auto_venv_chpwd() {
  # If we're leaving a venv, deactivate
  if [ -n "$VIRTUAL_ENV" ] && [[ "$PWD" != "$VIRTUAL_ENV"* ]]; then
    echo "Deactivating virtualenv: $(basename "$VIRTUAL_ENV")"
    deactivate 2>/dev/null || unset VIRTUAL_ENV
  fi

  # If we're entering a directory with .venv and not already in one, activate it
  if [ -z "$VIRTUAL_ENV" ] && [ -f ".venv/bin/activate" ]; then
    echo "Activating .venv in $(pwd)"
    source ".venv/bin/activate"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _auto_venv_chpwd