#!/bin/sh
set -e

# disable the fucking BEEEEEEP
sudo cp "./config/nobeep.conf" "/etc/modprobe.d/nobeep.conf"

# pacman config
sudo sed -i 's/# Misc options/# Misc options\nColor\nILoveCandy\nColor\nParallelDownloads = 5\nVerbosePkgLists/g' /etc/pacman.conf

# reflector
sudo pacman -Syu --needed --noconfirm reflector rsync
sudo reflector --save /etc/pacman.d/mirrorlist --latest 30 --sort rate

# base packages
sudo pacman -S --needed --noconfirm $(cat ./packages)

mkdir -p "$HOME/.config/environment.d/"
cp "./config/env-vars.conf" "$HOME/.config/environment.d/"

echo "probably a better way to do it, but just reboot and run main.sh, then [desktop, laptop].sh"
