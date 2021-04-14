# These are required for pyenv
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

# Brew
export PATH="/usr/local/sbin:$PATH"

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Use vi
export VISUAL=vim
export EDITOR="$VISUAL"