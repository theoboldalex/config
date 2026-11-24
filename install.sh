#!/usr/bin/env bash

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$HOME/.config"

# Back up a real file/folder at the target (never delete it), then symlink.
link() {
  local src="$1" dst="$2"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    if [ -e "$dst.backup" ]; then
      echo "Skipping $dst: $dst.backup already exists, move one of them first"
      return 1
    fi
    echo "Backing up $dst to $dst.backup"
    mv "$dst" "$dst.backup"
  fi
  ln -sfn "$src" "$dst"
  echo "Linked $dst -> $src"
}

# homebrew
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Installing apps and tools from Brewfile..."
brew bundle --file="$DOTFILES/Brewfile"

echo "Linking config files..."
mkdir -p "$CONFIG"

# shell config
link "$DOTFILES/.zshrc" "$HOME/.zshrc"

# vim config
link "$DOTFILES/.vimrc" "$HOME/.vimrc"

# emacs config
link "$DOTFILES/.emacs" "$HOME/.emacs"

# ghostty config
link "$DOTFILES/ghostty" "$CONFIG/ghostty"

# nvim config
link "$DOTFILES/nvim" "$CONFIG/nvim"

# claude code
mkdir -p "$HOME/.claude"
for f in settings.json statusline-command.sh; do
  link "$DOTFILES/claude/$f" "$HOME/.claude/$f"
done

echo "Done."
