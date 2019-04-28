# set color variables

DARK="\[\e[0m\]"
LIGHT="\[\e[1m\]"
K="\[\e[90m\]"          # blaK
R="\[\e[91m\]"          # Red
G="\[\e[92m\]"          # Green
Y="\[\e[93m\]"          # Yellow
B="\[\e[94m\]"          # Blue
M="\[\e[95m\]"          # Magenta
C="\[\e[96m\]"          # Cyan
W="\[\e[97m\]"          # White

export PS1="${R}[${Y}\u${G}@${B}\h ${M}\w${R}]${W}\$ ${W}"

# enable color support

alias ls='ls --color=auto'
alias grep='grep --color=auto'


set -o vi
