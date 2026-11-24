#!/usr/bin/env bash

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$HOME/.config"

# shell config
rm -f $HOME/.zshrc
ln -s $DOTFILES/.zshrc $HOME/.zshrc

# vim config
rm -f $HOME/.vimrc
ln -s $DOTFILES/.vimrc $HOME/.vimrc

# ghostty config
rm -f $CONFIG/ghostty
ln -s $DOTFILES/ghostty $CONFIG/ghostty

# nvim config
rm -f $CONFIG/nvim
ln -s $DOTFILES/nvim $CONFIG/nvim
