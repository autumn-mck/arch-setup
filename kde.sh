#!/bin/sh
set -e

. "$HOME/.config/environment.d/env-vars.conf"

xargs yay -Syu --needed --noconfirm < ./kde-packages

balooctl6 suspend
balooctl6 disable
balooctl6 purge

# KDE theme
git clone --depth=1 https://github.com/catppuccin/kde catppuccin-kde && cd "./catppuccin-kde"
yes | ./install.sh 2 4 1
ln -s "$HOME/.local/share/icons/" "$HOME/.icons"
cd ..
rm -rf ./catppuccin-kde
# also copy cursors to /usr/share/icons to make sure sddm can use them
sudo cp -r "$HOME/.local/share/icons/Catppuccin-Macchiato-Mauve-Cursors/" "/usr/share/icons/Catppuccin-Macchiato-Mauve-Cursors/"

# folder icons
papirus-folders -C cat-macchiato-mauve

# kdeglobals

## General

kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group General --key AllowKDEAppsToRememberWindowPositions "false"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group General --key font "IBM Plex Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group General --key fixed "mononoki,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group General --key menuFont "IBM Plex Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group General --key smallestReadableFont "IBM Plex Sans,8,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group General --key toolBarFont "IBM Plex Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group WM --key activeFont "IBM Plex Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"

## KDE

kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group KDE --key ScrollbarLeftClickNavigatesByPage "false"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group KDE --key SingleClick "false"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group KDE --key AnimationDurationFactor "0.35"

# kwinrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Desktops --key Number "8"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Desktops --key Rows "2"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Plugins --key blurEnabled "false"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Plugins --key lightlyshaders_blurEnabled "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Plugins --key krohnkiteEnabled "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Plugins --key dimscreenEnabled "true"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Effect-slide --key HorizontalGap "0"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Effect-slide --key VerticalGap "0"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Effect-slide --key SlideBackground "false"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group NightColor --key Active "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group NightColor --key NightTemperature "4400"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Windows --key DelayFocusInterval "0"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Windows --key FocusPolicy "FocusFollowsMouse"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Windows --key NextFocusPrefersMouse "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Windows --key RollOverDesktops "true"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Xwayland --key Scale "1.25"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key floatingClass "org.kde.kdialog,systemsettings,bitwarden,musicbee.exe,org.freedesktop.impl.portal.desktop.kde,Godot,zoom"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key noTileBorder "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key screenGapBetween "8"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key screenGapBottom "8"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key screenGapLeft "8"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key screenGapRight "8"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key screenGapTop "18"

# ksplashrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/ksplashrc" --group KSplash --key Theme "None"
kwriteconfig6 --file "$XDG_CONFIG_HOME/ksplashrc" --group KSplash --key Engine "none"

# ksmserverrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/ksmserverrc" --group General --key loginMode "emptySession"

# kscreenlockerrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/kscreenlockerrc" --group Daemon --key LockGrace "30"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kscreenlockerrc" --group Daemon --key Timeout "15"

# krunnerrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/krunnerrc" --group General --key FreeFloating "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/krunnerrc" --group Plugins --key baloosearchEnabled "false"

# kcminputrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/kcminputrc" --group Mouse --key X11LibInputXAccelProfileFlat "true"

# baloofilerc
kwriteconfig6 --file "$XDG_CONFIG_HOME/baloofilerc" --group "Basic Settings" --key Indexing-Enabled "false"

# kwinrulesrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrulesrc" --group "1" --key Description "No Min Window Size"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrulesrc" --group "1" --key minsize "1,1"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrulesrc" --group "1" --key minsizerule "2"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrulesrc" --group "1" --key types "1"

# dolphinrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/dolphinrc" --group General --key ShowFullPath "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/dolphinrc" --group General --key BrowseThroughArchives "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/dolphinrc" --group DetailsMode --key PreviewSize "22"

# lightly config
kwriteconfig6 --file "$XDG_CONFIG_HOME/lightlyshaders.conf" --group "General" --key DisabledForMaximized "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/lightlyshaders.conf" --group "General" --key InnerOutline "false"
kwriteconfig6 --file "$XDG_CONFIG_HOME/lightlyshaders.conf" --group "General" --key InnerOutlineColor "24,25,38"
kwriteconfig6 --file "$XDG_CONFIG_HOME/lightlyshaders.conf" --group "General" --key OuterOutlineColor "24,25,38"
kwriteconfig6 --file "$XDG_CONFIG_HOME/lightlyshaders.conf" --group "General" --key InnerOutlineWidth "2"
kwriteconfig6 --file "$XDG_CONFIG_HOME/lightlyshaders.conf" --group "General" --key OuterOutlineWidth "2"
kwriteconfig6 --file "$XDG_CONFIG_HOME/lightlyshaders.conf" --group "General" --key Roundness "10"

# plasma-org.kde.plasma.desktop-appletsrc


# kglobalshortcutsrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key "Switch One Desktop Down" "Meta+Ctrl+Down,Meta+Ctrl+Down,Switch One Desktop Down"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key "Switch One Desktop Up" "Meta+Ctrl+Up,Meta+Ctrl+Up,Switch One Desktop Up"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key "Switch One Desktop to the Left" "Meta+Ctrl+Left,Meta+Ctrl+Left,Switch One Desktop to the Left"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key "Switch One Desktop to the Right" "Meta+Ctrl+Right,Meta+Ctrl+Right,Switch One Desktop to the Right"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key "Window One Desktop Down" "Meta+Ctrl+Shift+Down,Meta+Ctrl+Shift+Down,Window One Desktop Down"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key "Window One Desktop Up" "Meta+Ctrl+Shift+Up,Meta+Ctrl+Shift+Up,Window One Desktop Up"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key "Window One Desktop to the Left" "Meta+Ctrl+Shift+Left,Meta+Ctrl+Shift+Left,Window One Desktop to the Left"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key "Window One Desktop to the Right" "Meta+Ctrl+Shift+Right,Meta+Ctrl+Shift+Right,Window One Desktop to the Right"

sudo mkdir -p "/etc/sddm.conf.d/"
sudo cp "./config/sddm_kde_settings.conf" "/etc/sddm.conf.d/kde_settings.conf"
sudo systemctl enable sddm.service
