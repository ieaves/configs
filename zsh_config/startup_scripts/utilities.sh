#!/bin/bash

profile_zsh(){
    export PROFILE=true
    source ~/.zshrc
}

settings() {
    ENV_FILE="${CONFIG_DIR}/settings.env"

    if [ "$1" = "--help" ]; then
        echo "Function: settings"
        echo "Description:"
        echo "  Updates or adds key-value environment settings in settings.env located in"
        echo "  \${CONFIG_DIR} (${CONFIG_DIR}). If the key exists, it updates the value;"
        echo "  if not, it appends the new key-value pair."
        echo
        echo "Special Case:"
        echo "  If the VALUE contains the KEY itself (e.g., PATH=\"\$PATH:/new/dir\"),"
        echo "  the function appends the new value instead of overwriting the existing one."
        echo
        echo "Usage:"
        echo "  settings KEY VALUE"
        echo
        echo "Arguments:"
        echo "  KEY   - The environment variable name to set."
        echo "  VALUE - The value to assign to the key."
        echo
        echo "Examples:"
        echo "  settings API_KEY abc12345         # Updates or adds API_KEY=abc12345"
        echo "  settings DEBUG true               # Updates or adds DEBUG=true"
        echo "  settings PATH \"\$PATH:/new/dir\"  # Appends PATH if self-referential"
        echo
        echo "Files:"
        echo "  ${ENV_FILE}     # The file where settings are stored."
        return 0
    fi

    KEY=$1
    VALUE=$2
    
    # Validate that both KEY and VALUE are provided
    if [ -z "$KEY" ] || [ -z "$VALUE" ]; then
        echo "Error: Both KEY and VALUE must be provided."
        settings --help
        return 1
    fi

    # Ensure the settings.env file exists
    mkdir -p "$CONFIG_DIR"
    touch "$ENV_FILE"

    ensure_newline() {
        if [ -s "$ENV_FILE" ] && [ -n "$(tail -c1 "$ENV_FILE")" ]; then
            echo >> "$ENV_FILE"
        fi
    }

    # Check if the key exists in settings.env
    if grep -q "^${KEY}=" "$ENV_FILE"; then
        # Check for self-referential values (e.g., PATH="$PATH:/new/dir")
        if [[ "$VALUE" == *"$KEY"* ]]; then
            # Append new value if self-referential
            ensure_newline
            echo "${KEY}=${VALUE}" >> "$ENV_FILE"
        else
            # Update the existing key
            sed -i '' -e "s/^${KEY}=.*/${KEY}=${VALUE}/g" "$ENV_FILE"
        fi
    else
        # If the key doesn't exist, append it
        ensure_newline
        echo "${KEY}=${VALUE}" >> "$ENV_FILE"
    fi

    if git -C "$CONFIG_DIR" rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        git -C "$CONFIG_DIR" add "$ENV_FILE"
        git -C "$CONFIG_DIR" commit -m "updating default environment values" --quiet
        git -C "$CONFIG_DIR" push origin --quiet
    else
        echo "Warning: ${CONFIG_DIR} is not a Git repository. Changes were made locally but not committed."
    fi
}

