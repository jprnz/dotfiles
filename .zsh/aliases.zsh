# Common aliases
alias grep='grep --color=auto'
alias ls='ls -hv --color=auto --group-directories-first'
alias ll='ls -lhvF --group-directories-first'
alias lah='ls -lavh --group-directories-first'

alias cp='cp -ai'
alias mv='mv -i'
alias rm='rm -I'
alias rl='readlink -f'
alias hn="hostname"
alias sz="srun -A sgt -p scavenger --mem 8G --pty zsh"
alias dus='du -k * | sort -nr | cut -f2 | xargs -d "\n" du -sh'

# Programs etc
alias vimdiff="vim -d"
alias tmux="tmux -2u"
alias dots="dotfiles"
alias vim="nvim"
alias view="nvim -R"
alias vimdiff="vim -d"
alias view="nvim -R"

# SLURM Aliases that provide information in a useful manner for our clusters
alias si="sinfo -o \"%20P %5D %14F %8z %10m %10d %11l %16f %N %C\""
alias si2="sinfo -o \"%20P %5D %6t %8z %10m %10d %11l %16f %N\""

