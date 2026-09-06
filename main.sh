#!/bin/sh
set -e

. "$HOME/.config/environment.d/env-vars.conf"

systemctl --user enable --now syncthing.service

sudo systemctl enable --now bluetooth paccache.timer

# firewall
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw default deny routed
sudo ufw logging low
sudo ufw app default skip

sudo ufw allow syncthing

# Civ6 LAN
sudo ufw allow from 192.168.0.52 to any port 62056 proto udp
sudo ufw allow from 192.168.0.52 to any port 62900 proto udp

sudo ufw --force enable
sudo systemctl enable --now ufw.service

# use kmscon for virtual consoles
sudo mkdir -p "/etc/kmscon"
sudo cp "./config/kmscon.conf" "/etc/kmscon/kmscon.conf"
sudo systemctl disable getty@.service
sudo systemctl enable kmsconvt@.service

# git config
git config --global init.defaultBranch main

# reflector
sudo mkdir -p "/etc/xdg/reflector"
sudo cp "./config/reflector.conf" "/etc/xdg/reflector/reflector.conf"
sudo mkdir -p "/etc/systemd/system/reflector.timer.d"
sudo cp "./config/reflector.timer.override" "/etc/systemd/system/reflector.timer.d/override.conf"
sudo systemctl enable --now reflector.timer

# set up yay
if ! command -v yay >/dev/null 2>&1; then
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	rm -rf "./yay"
fi

xargs yay -S --needed --noconfirm < ./aur-packages

# misc
sudo ln -sf "/usr/share/fontconfig/conf.avail/75-twemoji.conf" "/etc/fonts/conf.d/75-twemoji.conf"
mkdir -p "$XDG_CONFIG_HOME/tealdeer/"
cp "./config/tealdeer_config.toml" "$XDG_CONFIG_HOME/tealdeer/config.toml"
mkdir -p "$XDG_CONFIG_HOME/kitty/"
cp "./config/kitty.conf" "$XDG_CONFIG_HOME/kitty/kitty.conf"
cp "./config/current-theme.conf" "$XDG_CONFIG_HOME/kitty/current-theme.conf"
mkdir -p "$XDG_CONFIG_HOME/fastfetch/"
cp "./config/fastfetch_config.jsonc" "$XDG_CONFIG_HOME/fastfetch/config.jsonc"
cp "./config/fastfetch_arch3.txt" "$XDG_CONFIG_HOME/fastfetch/arch3.txt"
cp "./config/hyfetch.json" "$XDG_CONFIG_HOME/hyfetch.json"
mkdir -p "$XDG_CONFIG_HOME/Code/User/"
cp "./config/vscode_settings.json" "$XDG_CONFIG_HOME/Code/User/settings.json"

mkdir -p "$HOME/.librewolf"
cp "./config/librewolf.overrides.cfg.js" "$HOME/.librewolf/librewolf.overrides.cfg"

# gsettings stuff
gsettings set org.gnome.desktop.interface font-antialiasing \'rgba\'
gsettings set org.gnome.desktop.interface gtk-theme \'catppuccin-macchiato-mauve-standard+default\'

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
