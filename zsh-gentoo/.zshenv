export ZDOTDIR="$HOME/.config/zsh"

# Getting rofi to show flatpaks
export PATH="$PATH:/var/lib/flatpak/exports/bin:$HOME/.local/share/flatpak/exports/bin"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"
