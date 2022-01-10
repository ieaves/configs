# Pyenv
export PYENV_ROOT="$(pyenv root)"
export PATH="$PYENV_ROOT/bin:$PATH"

# zsh-autoswitch
export venv_type="poetry"
# Default autoswitch python
export AUTOSWITCH_DEFAULT_PYTHON="$PYENV_ROOT/versions/3.10.0/bin/python3"

# Brew
export PATH="/usr/local/sbin:$PATH"

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Use vi
export VISUAL=vim
export EDITOR="$VISUAL"

# For z.lua directory jumping
export _ZL_MATCH_MODE=1

# Kustomize Plugin Path
export XDG_CONFIG_HOME=\$HOME/.config

if [ "$(uname -s)" = "Linux" ];
then 
else
    # If you need to update CFLAGS or LDFLAGS installed by brew, add the package name to `applications`
    applications=('xz', 'lapack', 'curl')

    var=""
    for app in "${applications[@]}"
    do
        name="-L$(brew --prefix xz)/lib "
        var=$var$name
    done
    export LDFLAGS=$var

    var=""
    for app in "${applications[@]}"
    do
        name="-L$(brew --prefix xz)/include "
        var=$var$name
    done
    export CPPFLAGS=$var


    # Openblas
    export OPENBLAS="$(brew --prefix openblas)"
    export CFLAGS="-falign-functions=8 ${CFLAGS}"

    # Curl
    export PATH="/opt/homebrew/opt/curl/bin:$PATH"
    export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig"
fi


