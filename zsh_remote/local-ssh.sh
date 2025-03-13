#!/bin/bash

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Script is executed, not sourced
    LOCAL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
else
    # Script is sourced
    LOCAL_DIR="$(cd "$(dirname "${0}")" && pwd)"
fi


IDENTITY_FILE=""
if [[ "$1" == "-i" && -n "$2" ]]; then
    IDENTITY_FILE="$2"
    shift 2
fi

# Capture arguments
REMOTE_USER="$1"
REMOTE_HOST="$2"
REMOTE_DIR="~/.config/.ian-zsh-config/"

# Check if arguments are provided
if [ -z "$REMOTE_USER" ] || [ -z "$REMOTE_HOST" ]; then
    echo "Usage: local-ssh.sh <remote-user> <remote-host>"
    exit 1
fi

SSH_OPTS=""
if [[ -n "$IDENTITY_FILE" ]]; then
    SSH_OPTS="-i $IDENTITY_FILE"
fi

# Perform the rsync
rsync -azL --delete --mkpath -e "ssh $SSH_OPTS" "$LOCAL_DIR/" "${REMOTE_USER}@${REMOTE_HOST}:$REMOTE_DIR"

