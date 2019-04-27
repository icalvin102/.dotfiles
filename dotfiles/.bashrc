# set color variables

DARK="\[\e[0m\]"
LIGHT="\[\e[1m\]"
K="\[\e[30m\]"          # blaK
R="\[\e[31m\]"          # Red
G="\[\e[32m\]"          # Green
Y="\[\e[33m\]"          # Yellow
B="\[\e[34m\]"          # Blue
M="\[\e[35m\]"          # Magenta
C="\[\e[36m\]"          # Cyan
W="\[\e[37m\]"          # White

export PS1="${R}[${Y}\u${G}@${B}\h ${M}\w${R}]${W}\$ ${W}"

# enable color support

alias ls='ls --color=auto'
alias grep='grep --color=auto'


set -o vi
