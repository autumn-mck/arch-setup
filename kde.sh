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
ln -sfn "$HOME/.local/share/icons/" "$HOME/.icons"
cd ..
rm -rf ./catppuccin-kde
# also copy cursors to /usr/share/icons so the login greeter can use them
sudo cp -r "$HOME/.local/share/icons/Catppuccin-Macchiato-Mauve-Cursors/" "/usr/share/icons/Catppuccin-Macchiato-Mauve-Cursors/"

# kdeglobals

## General

kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group General --key AllowKDEAppsToRememberWindowPositions "false"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group General --key font "IBM Plex Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group General --key fixed "mononoki,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group General --key menuFont "IBM Plex Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group General --key smallestReadableFont "IBM Plex Sans,8,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group General --key toolBarFont "IBM Plex Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group WM --key activeFont "IBM Plex Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group General --key TerminalApplication "kitty"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group General --key TerminalService "kitty.desktop"

# KB = 1024 bytes
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group Locale --key BinaryUnitDialect "1"

# ie
kwriteconfig6 --file "$XDG_CONFIG_HOME/plasma-localerc" --group Formats --key LANG "en_IE.UTF-8"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kxkbrc" --group Layout --key LayoutList "ie"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kxkbrc" --group Layout --key Use "true"

## KDE

kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group KDE --key ScrollbarLeftClickNavigatesByPage "false"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group KDE --key SingleClick "false"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kdeglobals" --group KDE --key AnimationDurationFactor "0.35"

# kwinrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Desktops --key Number "8"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Desktops --key Rows "4"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Plugins --key blurEnabled "false"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Plugins --key lightlyshaders_blurEnabled "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Plugins --key krohnkiteEnabled "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Plugins --key dimscreenEnabled "true"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Effect-slide --key HorizontalGap "0"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Effect-slide --key VerticalGap "0"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Effect-slide --key SlideBackground "false"

# no screen edge for overview
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Effect-overview --key BorderActivate "9"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group ModifierOnlyShortcuts --key Meta "org.kde.krunner,/App,,toggleDisplay"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group NightColor --key Active "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group NightColor --key NightTemperature "4400"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Windows --key DelayFocusInterval "0"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Windows --key FocusPolicy "FocusFollowsMouse"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Windows --key NextFocusPrefersMouse "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Windows --key RollOverDesktops "true"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Xwayland --key Scale "2"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Xwayland --key XwaylandEisNoPromptApps "xdotool"

kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key floatConfig "org.kde.kdialog,systemsettings,bitwarden,[nngceckbapebfimnlniiiahkandclblb],musicbee.exe,org.freedesktop.impl.portal.desktop.kde,Godot,zoom"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key ignoreClass "krunner,yakuake,spectacle,kded5,xwaylandvideobridge,plasmashell,ksplashqml,org.kde.plasmashell,org.kde.polkit-kde-authentication-agent-1,org.kde.kruler,kruler,kwin_wayland,ksmserver-logout-greeter,systemsettings,chrome-nngceckbapebfimnlniiiahkandclblb-Default"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key ignoreTitle "Bitwarden,Extension: (Bitwarden Password Manager) - Bitwarden — LibreWolf"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key noTileBorder "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key screenGapBetween "8"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key screenGapBottom "8"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key screenGapLeft "8"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key screenGapRight "18"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kwinrc" --group Script-krohnkite --key screenGapTop "8"

# ksplashrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/ksplashrc" --group KSplash --key Theme "None"
kwriteconfig6 --file "$XDG_CONFIG_HOME/ksplashrc" --group KSplash --key Engine "none"

# ksmserverrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/ksmserverrc" --group General --key loginMode "emptySession"

# kscreenlockerrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/kscreenlockerrc" --group Daemon --key LockGrace "30"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kscreenlockerrc" --group Daemon --key Timeout "15"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kscreenlockerrc" --group Greeter --group LnF --group General --key alwaysShowClock "false"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kscreenlockerrc" --group Greeter --group LnF --group General --key showMediaControls "false"

# krunnerrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/krunnerrc" --group General --key FreeFloating "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/krunnerrc" --group Plugins --key baloosearchEnabled "false"

# kcminputrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/kcminputrc" --group Mouse --key cursorSize "48"
# flat acceleration for mice
kwriteconfig6 --file "$XDG_CONFIG_HOME/kcminputrc" --group Libinput --group 1133 --group 45108 --group "Logitech MX Master 3S" --key PointerAccelerationProfile "1"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kcminputrc" --group Libinput --group 1133 --group 49291 --group "Logitech G502 HERO Gaming Mouse" --key PointerAccelerationProfile "1"
# framework touchpad
kwriteconfig6 --file "$XDG_CONFIG_HOME/kcminputrc" --group Libinput --group 2362 --group 628 --group "PIXA3854:00 093A:0274 Touchpad" --key NaturalScroll "true"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kcminputrc" --group Libinput --group 2362 --group 628 --group "PIXA3854:00 093A:0274 Touchpad" --key DisableWhileTyping "false"

# powerdevilrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/powerdevilrc" --group AC --group Display --key DimDisplayIdleTimeoutSec "600"
kwriteconfig6 --file "$XDG_CONFIG_HOME/powerdevilrc" --group AC --group Display --key TurnOffDisplayIdleTimeoutSec "900"
kwriteconfig6 --file "$XDG_CONFIG_HOME/powerdevilrc" --group AC --group SuspendAndShutdown --key AutoSuspendIdleTimeoutSec "1800"
kwriteconfig6 --file "$XDG_CONFIG_HOME/powerdevilrc" --group AC --group SuspendAndShutdown --key LidAction "0"
kwriteconfig6 --file "$XDG_CONFIG_HOME/powerdevilrc" --group Battery --group Display --key DimDisplayIdleTimeoutSec "300"
kwriteconfig6 --file "$XDG_CONFIG_HOME/powerdevilrc" --group Battery --group Display --key TurnOffDisplayIdleTimeoutSec "600"

# kiorc
kwriteconfig6 --file "$XDG_CONFIG_HOME/kiorc" --group Confirmations --key ConfirmDelete "false"
kwriteconfig6 --file "$XDG_CONFIG_HOME/kiorc" --group Confirmations --key ConfirmTrash "false"

# kaccessrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/kaccessrc" --group Bell --key SystemBell "false"

# plasmanotifyrc
kwriteconfig6 --file "$XDG_CONFIG_HOME/plasmanotifyrc" --group Notifications --key PopupPosition "TopRight"

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
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key Overview 'none,Meta+W,Toggle Overview'
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key 'Show Desktop' 'none,Meta+D,Peek at Desktop'
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key 'Window Close' 'Alt+F4	Meta+C,Alt+F4,Close Window'
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key 'Window On All Desktops' 'Meta+D,none,Keep Window on All Desktops'
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group plasmashell --key 'manage activities' 'none,Meta+Q,Show Activity Switcher'
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group plasmashell --key 'previous activity' 'Meta+Shift+A,none,Walk through activities (Reverse)'
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group plasmashell --key 'show dashboard' 'none,Ctrl+F12,Show Desktop'
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group services --group helium.desktop --key new-window Meta+W
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group services --group code.desktop --key _launch Meta+A
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group services --group kitty.desktop --key _launch Meta+Q
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group services --group org.kde.spectacle.desktop --key RectangularRegionScreenShot 'Meta+S	Meta+Shift+Print'

kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group services --group systemsettings.desktop --key _launch '	Tools'

kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key KrohnkiteFocusNext 'none,none,Krohnkite: Focus Next'
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key KrohnkiteFocusRight 'none,none,Krohnkite: Focus Right'
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key KrohnkiteDecrease 'none,none,Krohnkite: Decrease'
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key KrohnkiteRotate 'none,none,Krohnkite: Rotate'
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key KrohnkiteRotatePart 'none,none,Krohnkite: Rotate Part'
kwriteconfig6 --file "$XDG_CONFIG_HOME/kglobalshortcutsrc" --group kwin --key KrohnkiteTileLayout 'none,none,Krohnkite: Tile Layout'

# plasma-login-manager
sudo kwriteconfig6 --file "/etc/plasmalogin.conf" --group Autologin --key Relogin "false"
sudo kwriteconfig6 --file "/etc/plasmalogin.conf" --group Greeter --key ShowClock "true"
sudo systemctl enable plasmalogin.service
