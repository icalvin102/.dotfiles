#!/bin/sh

export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export TERMINAL="wezterm"
export BROWSER="brave"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export XDG_SESSION_TYPE=wayland
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export CLUTTER_BACKEND=wayland
export XDG_CURRENT_DESKTOP=Hyprland
export XCOMPOSEFILE="$HOME/.XCompose"

# Start Hyprland on TTY1
if [ "$(tty)" = "/dev/tty1" ] && ! pgrep Hyprland >/dev/null; then
    exec Hyprland
fi
