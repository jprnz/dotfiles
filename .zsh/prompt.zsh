function _set_block_cursor() {
  _set_cursor '\e[2 q'
}

function _set_beam_cursor() {
  _set_cursor '\e[0 q'
}

setprompt () {
    # Need this so the prompt will work.
    setopt prompt_subst

    # See if we can use colors.
    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
      colors
    fi
    for color in BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
      eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
      eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
      (( count = $count + 1 ))
    done
    PR_NO_C="%{$terminfo[sgr0]%}"

    # PWD width
    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 50 ))

    local PROMPTSIZE=${#${(%):--- %D{%R.%S %a %b %d %Y}\! }}
    local PWDSIZE=${#${(%):-%~}}

    if [[ "$PROMPTSIZE + $PWDSIZE" -gt $TERMWIDTH ]]; then
      (( PR_PWDLEN = $TERMWIDTH - $PROMPTSIZE ))
    fi

   # Show vi mode
   function zle-keymap-select {
      VIMODE="${${KEYMAP/vicmd/$PR_BLUE}/(main|viins)/$PR_YELLOW}"
      zle reset-prompt
   }
   zle -N zle-keymap-select

   PS1=$'$PR_BLACK<$PR_YELLOW%~$PR_BLACK>$PR_YELLOW>${VIMODE}>$PR_NO_C '
}

setprompt
