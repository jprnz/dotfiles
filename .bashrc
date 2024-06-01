# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Options
set -o noclobber
shopt -s checkwinsize
shopt -s globstar
shopt -s histappend
shopt -s cmdhist
shopt -s nocaseglob

# Dircolors
eval "$(dircolors $HOME/.dircolors)"

# History
PROMPT_COMMAND='history -a'
HISTSIZE=5000
HISTFILESIZE=10000
HISTCONTROL="erasedups:ignoreboth"
HISTTIMEFORMAT='%F %T '
HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Completion
bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"
bind "set mark-symlinked-directories on"

# Aliases
alias grep='grep --color=auto'
alias ls='ls -hv --color=auto --group-directories-first'
alias ll='ls -lhvF --group-directories-first'
alias lah='ls -lavh --group-directories-first'

# Set umask
umask 007

