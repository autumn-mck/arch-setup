#!/bin/sh
set -e

source "$HOME/.config/environment.d/env-vars.conf"

systemctl --user enable --now syncthing.service

sudo systemctl enable --now bluetooth

# git config
git config --global init.defaultBranch main

# reflector
sudo mkdir -p "/etc/xdg/reflector"
sudo cp "./config/reflector.conf" "/etc/xdg/reflector/reflector.conf"
sudo mkdir -p "/etc/systemd/system/reflector.timer.d"
sudo cp "./config/reflector.timer.override" "/etc/systemd/system/reflector.timer.d/override.conf"
sudo systemctl enable --now reflector.timer

# set up paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf "./paru"

paru -S --needed --noconfirm $(cat ./aur-packages)

# misc
sudo ln -sf "/usr/share/fontconfig/conf.avail/75-twemoji.conf" "/etc/fonts/conf.d/75-twemoji.conf"
mkdir -p "$XDG_CONFIG_HOME/ArmCord/storage/"
cp "./config/armcord-settings.json" "$XDG_CONFIG_HOME/ArmCord/storage/settings.json"
mkdir -p "$XDG_CONFIG_HOME/Bitwarden/"
cp "./config/bitwarden-data.json" "$XDG_CONFIG_HOME/Bitwarden/data.json"
mkdir -p "$XDG_CONFIG_HOME/neofetch/"
cp "./config/neofetch_config.conf" "$XDG_CONFIG_HOME/neofetch/config.conf"
mkdir -p "$XDG_CONFIG_HOME/tldr/"
cp "./config/tealdeer_config.toml" "$XDG_CONFIG_HOME/tldr/config.toml"
mkdir -p "$XDG_CONFIG_HOME/kitty/"
cp "./config/kitty.conf" "$XDG_CONFIG_HOME/kitty/kitty.conf"
mkdir -p "$XDG_CONFIG_HOME/fastfetch/"
cp "./config/fastfetch_config.jsonc" "$XDG_CONFIG_HOME/fastfetch/config.jsonc"
cp "./config/hyfetch.json" "$XDG_CONFIG_HOME/hyfetch.json"

# gsettings stuff
gsettings set org.gnome.desktop.interface font-antialiasing \'rgba\'
gsettings set org.gnome.desktop.interface gtk-theme \'Catppuccin-Macchiato-Standard-Mauve-Dark\'

# syncthing
syncthing cli config folders add --id qg4t0-4eepi --label "Android Camera" --path "$HOME/Pictures/AndroidCamera"
syncthing cli config folders add --id upigg-w6x5l --label "Desktop"        --path "$HOME/Desktop"
syncthing cli config folders add --id 3yaff-abx57 --label "Documents"      --path "$HOME/Documents/Documents/"
syncthing cli config folders add --id rsjpd-6ubkv --label "music (backup)" --path "$HOME/Music/backup/"
syncthing cli config folders add --id kjmaq-xt5wt --label "music (main)"   --path "$HOME/Music/main/"
syncthing cli config folders add --id 6t4yf-vv72f --label "music (shared)" --path "$HOME/Music/shared/"
syncthing cli config folders add --id sf7cu-wwnwq --label "vault (shared)" --path "$HOME/vault/"

sh ./fish.sh
sh ./kde.sh
