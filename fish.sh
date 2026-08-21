#!/bin/sh
set -e

fisher_packages="pure-fish/pure jorgebucaran/autopair.fish meaningful-ooo/sponge franciscolourenco/done catppuccin/fish"

paru -S --needed --noconfirm fish fisher
fish -c "fisher install $fisher_packages"
