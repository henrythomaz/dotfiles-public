#!/usr/bin/env bash
mkdir -p ~/.config

ln -sf "$(pwd)/.config/fish" ~/.config/fish
ln -sf "$(pwd)/.config/lazygit" ~/.config/lazygit
ln -sf "$(pwd)/.gitconfig" ~/.gitconfig
