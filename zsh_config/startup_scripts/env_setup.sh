# # Pyenv
# export PYENV_ROOT="$(pyenv root)"
# export PATH="$PYENV_ROOT/bin:$PATH"
# export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# zsh-autoswitch
export venv_type="uv"

# UV Venv
export UV_VENV_PATH="$(pwd)/.venv"

# Brew
eval $(/opt/homebrew/bin/brew shellenv)
export BREW_PREFIX=$(brew --prefix)
export PATH="/usr/local/sbin:$PATH"
export PATH="$BREW_PREFIX/bin:$PATH"


# Poetry
export POETRY_HOME="$HOME/.configs/pypoetry"
export PATH="$POETRY_HOME:$PATH"

# Pipx
export PATH="$PATH:$HOME/.local/bin"

# Use vi
export VISUAL=vim
export EDITOR="$VISUAL"

# ZSH COMPDUMP
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export ANTIDOTE_DIR=${BREW_PREFIX}/opt/antidote/share/antidote

# ZSH Autoquoter configs
# export ZAQ_PREFIXES=('git commit -m' 'ssh *')
# export ZSH_HIGHLIGHT_HIGHLIGHTERS=ZSH_HIGHLIGHT_HIGHLIGHTERS+(zaq)

# Kustomize Plugin Path
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="${PATH}:${HOME}/.krew/bin"

# LLVM
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# ZSH Configs
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion history)

# Podman
export CONTAINERS_MACHINE_PROVIDER=libkrun