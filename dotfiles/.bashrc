# set color variables

RESET="\[\033[0m\]"
BOLD="\[\033[1m\]"
K="\[\033[30m\]"          # blaK
R="\[\033[31m\]"          # Red
G="\[\033[32m\]"          # Green
Y="\[\033[33m\]"          # Yellow
B="\[\033[34m\]"          # Blue
M="\[\033[35m\]"          # Magenta
C="\[\033[36m\]"          # Cyan
W="\[\033[37m\]"          # White

export PS1="${BOLD}${R}[${Y}\u${G}@${B}\h ${M}\w${R}]${W}\$ ${W}${RESET}"

# enable color support

alias ls='ls --color=auto'
alias grep='grep --color=auto'


set -o vi


