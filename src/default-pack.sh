#!/bin/bash

# install dev-icons
bash src/dev-icons.sh

apps_check=$(flatpak list)

# install apps
if [[ "$apps_check" != *"google"* ]]; then
    flatpak install flathub com.google.Chrome -y
    gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'com.google.Chrome.desktop']" # dock shortcut
fi
if [[ "$apps_check" != *"firefox"* ]]; then
    flatpak install flathub org.mozilla.firefox -y # install
    gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'org.mozilla.firefox.desktop']" # dock shortcut
    xdg-settings set default-web-browser org.mozilla.firefox.desktop # set as default browser
fi
if [[ "$apps_check" != *"flameshot"* ]]; then
    flatpak install flathub org.flameshot.Flameshot -y
fi
if [[ "$apps_check" != *"qBittorrent"* ]]; then
    flatpak install flathub org.qbittorrent.qBittorrent -y
fi
if [[ "$apps_check" != *"VLC"* ]]; then
    flatpak install flathub org.videolan.VLC -y
fi
if [[ "$(whereis simplescreenrecorder)" != *"/usr/bin/simplescreenrecorder"* ]]; then
    sudo apt install simplescreenrecorder -y
fi
if [[ "$(whereis fdfind)" != *"/usr/bin/fdfind"* ]]; then
    sudo apt install fd-find -y
fi
if [[ "$(whereis batcat)" != *"/usr/bin/batcat"* ]]; then
    sudo apt install bat -y
fi
if [[ "$(whereis batcat)" != *"/usr/bin/batcat"* ]]; then
    sudo apt install bat -y
fi
if [[ "$(whereis rg)" != *"/usr/bin/rg"* ]]; then
    sudo apt install ripgrep -y
fi
if [[ "$(whereis micro)" != *"/usr/bin/micro"* ]]; then
    sudo apt install micro -y
fi
if [[ "$(whereis bashtop)" != *"/usr/bin/bashtop"* ]]; then
    sudo add-apt-repository --yes ppa:bashtop-monitor/bashtop
    sudo apt update -y
    sudo apt install bashtop -y
fi
if [[ "$(whereis tldr)" != *"/bin/tldr"* ]]; then
    if [[ "$(whereis node)" != *"versions/node/"* ]]; then
        bash src/node.sh
    fi
    npm install -g tldr
fi

# Set keyboard shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
"[ \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot1/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot2/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/vscode/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/dbeaver/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/insomnia/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/obsidian/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/discord/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/google/'  \
]"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot1/ name 'Flameshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot1/ command 'flatpak run org.flameshot.Flameshot gui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot1/ binding '<Shift>Print'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot2/ name 'Flameshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot2/ command 'flatpak run org.flameshot.Flameshot gui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot2fff/ binding 'Print'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/vscode/ name 'VSCode'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/vscode/ command 'flatpak run com.visualstudio.code'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/vscode/ binding '<Super>V'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/dbeaver/ name 'DBeaver'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/dbeaver/ command 'flatpak run io.dbeaver.DBeaverCommunity'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/dbeaver/ binding '<Super>B'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/insomnia/ name 'Insomnia'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/insomnia/ command 'flatpak run rest.insomnia.Insomnia'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/insomnia/ binding '<Super>I'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/obsidian/ name 'Obsidian'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/obsidian/ command 'flatpak run md.obsidian.Obsidian'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/obsidian/ binding '<Super>O'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/discord/ name 'Discord'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/discord/ command 'flatpak run com.discordapp.Discord'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/discord/ binding '<Super>D'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/google/ name 'Google'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/google/ command 'flatpak run com.google.Chrome'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/google/ binding '<Super>G'