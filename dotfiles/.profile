#!/bin/sh

export PATH="$HOME/.scripts:$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x dwm >/dev/null && exec startx

export PG_OF_PATH=/home/calvin/build/of
