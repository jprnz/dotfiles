# Source zsh files 
ZSHDIR="$HOME/.zsh"
for config in $ZSHDIR/*.zsh; source $config

# History
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTFILE=$ZSHDIR/.history

# Export statements
export EDITOR="vim"
export VISUAL="vim"
export MANPAGER='less'
export DIRSTACKSIZE=6
export LESSCHARSET='utf-8'
export RXVT_SOCKET="$HOME/.urxvt/tmp"
export TMUX_TMPDIR="$HOME/.tmux_sessions"

# Colors
eval $(dircolors -b $HOME/.dircolors)

# Ensure umask is set
umask 007

# These need to be sourced last
source $ZSHDIR/plugins/zsh-fzf/completion.zsh
source $ZSHDIR/plugins/zsh-fzf/bindings.zsh
source $ZSHDIR/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh
source $ZSHDIR/plugins/zsh-completions/zsh-completions.plugin.zsh
source $ZSHDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

