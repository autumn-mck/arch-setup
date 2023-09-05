#!/bin/sh
set -e

packages="fish fisher"
fisher_packages="pure-fish/pure jorgebucaran/autopair.fish meaningful-ooo/sponge franciscolourenco/done"

paru -S --needed --noconfirm $packages
fish -c "fisher install $fisher_packages"
