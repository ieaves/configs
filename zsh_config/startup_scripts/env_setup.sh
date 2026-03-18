# # Pyenv
# export PYENV_ROOT="$(pyenv root)"
# export PATH="$PYENV_ROOT/bin:$PATH"
# export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# zsh-autoswitch
export venv_type="uv"

# UV Venv
export UV_VENV_PATH="$(pwd)/.venv"

# Brew (static — avoids subprocess on every shell start)
export HOMEBREW_PREFIX=/opt/homebrew
export HOMEBREW_CELLAR=/opt/homebrew/Cellar
export HOMEBREW_REPOSITORY=/opt/homebrew
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/sbin${PATH+:$PATH}
export MANPATH=/opt/homebrew/share/man${MANPATH+:$MANPATH}:
export INFOPATH=/opt/homebrew/share/info:${INFOPATH:-}
export BREW_PREFIX=/opt/homebrew

# Pipx
export PATH="$PATH:$HOME/.local/bin"

# Use vi
export VISUAL=vim
export EDITOR="$VISUAL"

# ZSH COMPDUMP
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export ANTIDOTE_DIR=${BREW_PREFIX}/opt/antidote/share/antidote

# Kustomize Plugin Path
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="${PATH}:${HOME}/.krew/bin"

# LLVM
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# ZSH Configs
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion history)

# NVM lazy load (must be set before antidote loads zsh-nvm)
export NVM_LAZY_LOAD=true

# Podman
export CONTAINERS_MACHINE_PROVIDER=libkrun
