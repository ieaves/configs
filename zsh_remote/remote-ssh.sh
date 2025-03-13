detect_package_manager() {
    if command -v apt &> /dev/null; then
        echo "apt"
    elif command -v brew &> /dev/null; then
        echo "brew"
    else
        echo "No known package manager found." >&2
        exit 1
    fi
}

export CONFIG_DIR=~/.config/.ian-zsh-config

if [ ! -d "${ZDOTDIR:-$HOME}/.antidote" ]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
fi


export STARSHIP_CONFIG=~/.config/starship.toml
tooling_starship_config=$CONFIG_DIR/starship.toml

if ! command -v starship >/dev/null 2>&1; then
    curl -sS https://starship.rs/install.sh | sh -s -- --yes
fi

if ! command -v zsh >/dev/null 2>&1; then
    PACKAGE_MANAGER=$(detect_package_manager)
    sudo $PACKAGE_MANAGER install zsh
fi

cp $CONFIG_DIR/master.sh ~/.zshrc