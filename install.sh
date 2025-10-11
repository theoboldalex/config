#!/usr/bin/env bash

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shell config
rm -f $HOME/.zshrc
ln -s $DOTFILES/.zshrc $HOME/.zshrc

# vim config
rm -f $HOME/.vimrc
ln -s $DOTFILES/.vimrc $HOME/.vimrc

# ghostty config
rm -f $HOME/.config/ghostty
ln -s $DOTFILES/ghostty $HOME/.config/ghostty

# nvim config
rm -f $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim
