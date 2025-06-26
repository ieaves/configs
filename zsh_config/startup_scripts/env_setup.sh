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

if [ "$(uname -s)" = "Linux" ];
then 
else
    # If you need to update CFLAGS or LDFLAGS installed by brew, add the package name to `applications`
    applications=('xz' 'lapack' 'curl' 'ruby' 'llvm' 'zlib' 'openssl@3' 'readline' 'unixodbc')

    ldflags=""
    cppflags=""
    for app in "${applications[@]}"
    do
        name="$(brew --prefix ${app})"
        ldflags="$ldflags -L$name/lib"
        cppflags="$cppflags -I$name/include"
    done
    export LDFLAGS="$(echo $ldflags | xargs)"
    export CPPFLAGS="$(echo $cppflags | xargs)"

    unset name ldflags cppflags applications
    # Openblas
    export OPENBLAS="$(brew --prefix openblas)"
    export CFLAGS="-falign-functions=8 ${CFLAGS}"

    # Curl
    export PATH="/opt/homebrew/opt/curl/bin:$PATH"
    export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig"

    # Openssl
    export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

    # zlib
    export PATH="/opt/homebrew/opt/zlib/bin:$PATH"

    # SQLlite
    export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
fi



# Pipx 
# export PATH="$PATH:/Users/ian/.local/bin"

# Jetbrains
# export PATH="/Users/jetbrains/.local/bin:$PATH"

