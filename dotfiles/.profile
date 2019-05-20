#!/bin/sh

export PATH="$HOME/.scripts:$PATH"
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="brave"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x dwm >/dev/null && exec startx

