#!/usr/bin/env bash

command=$(cat $HOME/.zsh_history | sort | uniq | fzf)

bash -c "$command"
