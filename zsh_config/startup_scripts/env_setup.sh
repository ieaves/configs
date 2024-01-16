# Pyenv
export PYENV_ROOT="$(pyenv root)"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# zsh-autoswitch
export venv_type="poetry"

# Default autoswitch python
export AUTOSWITCH_DEFAULT_PYTHON="$PYENV_ROOT/versions/3.10.0/bin/python3"

# Brew
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

export ANTIDOTE_DIR=$(brew --prefix)/opt/antidote/share/antidote

# ZSH Autoquoter configs
export ZAQ_PREFIXES=('git commit -m' 'ssh *')
export ZSH_HIGHLIGHT_HIGHLIGHTERS=ZSH_HIGHLIGHT_HIGHLIGHTERS+(zaq)

# For z.lua directory jumping
export _ZL_MATCH_MODE=1

# Kustomize Plugin Path
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="${PATH}:${HOME}/.krew/bin"

# LLVM
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

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

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"


# Pipx 
# export PATH="$PATH:/Users/ian/.local/bin"

# Jetbrains
# export PATH="/Users/jetbrains/.local/bin:$PATH"
