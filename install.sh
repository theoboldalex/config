#!/usr/bin/env bash

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shell config
rm -f $HOME/.zshrc
ln -s $DOTFILES/.zshrc $HOME/.zshrc

# vim config
rm -f $HOME/.vimrc
ln -s $DOTFILES/.vimrc $HOME/.vimrc
