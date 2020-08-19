sxhkd &
[ -f ~/.fehbg ] && ~/.fehbg &
xset r rate 250 40 &
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap &
dwm-status &
dwm
