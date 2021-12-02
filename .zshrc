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
export GREP_COLORS="38;5;230:sl=38;5;240:cs=38;5;100:mt=33;1;38;5;161:fn=38;5;197:ln=38;5;212:bn=38;5;44:se=38;5;166"
eval `dircolors -b $HOME/.dircolors`

# Ensure umask is set
umask 007

# Vi mode
bindkey -v
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M viins '^z' undo
bindkey -M viins '^i' expand-or-complete-prefix 
bindkey -M viins '^b' backward-word
bindkey -M viins ' '  magic-space
bindkey -M viins '^w' backward-delete-word
bindkey -M viins '^f' forward-word

bindkey -rp 'r' 
bindkey 'r' self-insert-unmeta
stty -ixon

# Ensure key do things...
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# These need to be sourced last
source $ZSHDIR/plugins/zsh-completions/zsh-completions.plugin.zsh
source $ZSHDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

