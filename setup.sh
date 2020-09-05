#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install rbenv tmux git vim zsh

ln -s "$PWD/spacemacs" "$HOME/.spacemacs"
ln -s "$PWD/tmux.conf" "$HOME/.tmux.conf"
ln -s "$PWD/zshrc" "$HOME/.zshrc"
