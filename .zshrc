# Source zsh files, order matters
configs=(
  "setopt.zsh"
  "completions.zsh"
  "bindings.zsh"
  "prompt.zsh"
  "aliases.zsh"
  "functions.zsh"
)

ZSHDOTDIR="$HOME/.zsh"
for config in ${configs[@]}; source $ZSHDOTDIR/$config

# History
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTFILE=$ZSHDOTDIR/.history

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
source $ZSHDOTDIR/plugins/zsh-fzf/completion.zsh
source $ZSHDOTDIR/plugins/zsh-fzf/bindings.zsh
source $ZSHDOTDIR/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh
source $ZSHDOTDIR/plugins/zsh-completions/zsh-completions.plugin.zsh
source $ZSHDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

