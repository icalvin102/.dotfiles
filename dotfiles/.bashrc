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

# .bash_history

export HISTTIMEFORMAT="%F %T "
export HISTSIZE=10000
export HISTFILESIZE=100000000
shopt -s histappend
PROMPT_COMMAND='history -a'
export HISTCONTROL=ignorespace
shopt -s cmdhist

# enable color support

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tmux='tmux -2'

set -o vi

# aliases

alias vi='nvim'
alias restartpulseaudio='pulseaudio -k && pulseaudio --start'
alias toclipboard='xclip -selection clipboard -i'

[ -f ~/.bashrc_local ] && source ~/.bashrc_local

[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
