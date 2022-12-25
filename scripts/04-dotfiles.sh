#!/bin/bash
set -e

echo "installed..."
if [ -e ~/.local/src/dotfiles.git ]; then
	exit
fi

DOTFILES_REPO_URL=$(dirname "$(git config --get remote.origin.url)")/dotfiles.git

mkdir -p ~/.local/src
git clone --bare "$DOTFILES_REPO_URL" ~/.local/src/dotfiles.git
alias dotfiles='git --git-dir="$HOME/.local/src/dotfiles.git" --work-tree="$HOME"'
dotfiles config status.showUntrackedFiles no
dotfiles checkout --force
dotfiles submodule update --init --recursive
