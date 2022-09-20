# Source zsh files, order matters
configs=(
  "completions.zsh"
  "bindings.zsh"
  "prompt.zsh"
  "aliases.zsh"
  "functions.zsh"
)

ZDOTDIR="$HOME/.zsh"
for config in ${configs[@]}; source $ZDOTDIR/$config

# History
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTFILE=$ZDOTDIR/.history

# Export statements
export SHELL="$(readlink -f $(which zsh))"
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER='less'
export DIRSTACKSIZE=6
export LESSCHARSET='utf-8'
export TMUX_TMPDIR="$HOME/.tmux_sessions"

# Colors
eval $(dircolors -b $HOME/.dircolors)

# Ensure umask is set
umask 007

# These need to be sourced last
eval "$(zoxide init zsh --cmd "cd")"
source $ZDOTDIR/plugins/zsh-fzf/completion.zsh
source $ZDOTDIR/plugins/zsh-fzf/bindings.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# Config for autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

