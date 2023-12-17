#!/bin/bash

if [ -n "$ZSH_VERSION" ]; then
   CONFIG_FILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
   CONFIG_FILE="$HOME/.bashrc"
else
   echo "Unsupported shell."
   exit 1
fi

if grep -q "mkcdir()" "$CONFIG_FILE"; then
    echo "mkcdir is already installed."
    exit 0
fi

echo "Adding mkcdir to your $CONFIG_FILE..."
cat "$(dirname "$0")/mkcdir.sh" >> "$CONFIG_FILE"
echo "Reloading $CONFIG_FILE..."
source "$CONFIG_FILE"

echo "mkcdir installed successfully."
