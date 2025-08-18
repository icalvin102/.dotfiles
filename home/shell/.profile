#!/bin/sh

export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x dwm >/dev/null && exec startx "$XINITRC"

export PG_OF_PATH=/home/calvin/build/of
