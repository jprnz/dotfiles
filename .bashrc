# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# History configuration
shopt -s histappend
shopt -s cmdhist
PROMPT_COMMAND='history -a'
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000

umask 007
