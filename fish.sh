#!/bin/sh
set -e

fisher_packages="pure-fish/pure jorgebucaran/autopair.fish meaningful-ooo/sponge franciscolourenco/done catppuccin/fish"

yay -S --needed --noconfirm fish fisher
fish -c "fisher install $fisher_packages"
echo y | fish -c 'fish_config theme save "Catppuccin Macchiato"'

mkdir -p "$HOME/.config/fish/functions"
cp ./config/fish/functions/*.fish "$HOME/.config/fish/functions/"
cp ./config/bashrc "$HOME/.bashrc"
