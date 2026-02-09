#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

for f in $(find . ! -name install.sh ! -path "./.git/*" -type f); do
    src=$(readlink -f "$f")
    dest="$HOME/$f"
    if [ -L "$dest" ] && [ "$(readlink -f "$dest")" = "$src" ]; then
        echo -e "${GREEN}✓ already linked:${RESET} $dest"
    elif err=$(ln -fs "$src" "$dest" 2>&1); then
        echo -e "${GREEN}✓ linked:${RESET} $dest -> $src"
    else
        echo -e "${RED}✗ failed:${RESET} $dest -> $src\n  ${RED}$err${RESET}"
    fi
done
