# Common aliases
alias grep='grep --color=auto'
alias ls='ls -hv --color=auto --group-directories-first'
alias ll='ls -lhvF --group-directories-first'
alias lah='ls -lavh --group-directories-first'

alias cp='cp -ai'
alias mv='mv -i'
alias rm='rm -I'
alias hn="hostname"
alias dus='du -k * | sort -nr | cut -f2 | xargs -d "\n" du -sh'

# Programs etc
alias view="vim -R"
alias viewdiff="vimdiff -R"
alias tmux="tmux -2u"
alias ddsc="export DDSCLIENT_CONF=$HOME/.ddsclient; ddsclient" 
alias oddsc="export DDSCLIENT_CONF=$HOME/.ddsclient_omicscore; ddsclient" 
alias sddsc="export DDSCLIENT_CONF=$HOME/.ddsclient_seqcore; ddsclient" 
alias dots="dotfiles"

# SLURM Aliases that provide information in a useful manner for our clusters
alias si="sinfo -o \"%20P %5D %14F %8z %10m %10d %11l %16f %N\""
alias si2="sinfo -o \"%20P %5D %6t %8z %10m %10d %11l %16f %N\""
alias sa="sacct --allocations --parsable2 --format \"jobid,jobname,account,nodelist,elapsed,state,exitcode\""

