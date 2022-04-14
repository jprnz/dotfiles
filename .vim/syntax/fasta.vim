if exists('b:current_syntax')
  finish
endif

setlocal foldenable
setlocal foldmethod=syntax

syn case ignore

syn match   fastaComment     ";.*$" 

syn region  fastaRecord      start=/>/ end=/\n>/hs=e fold

"syn keyword fastaHeaderStart "^>"
"syn match   fastaNumber      "[0-9]\+"
"syn match   fastaOperator    "[;,\?\:\.\<=\>\~\/\@\!$\%&\+\-\|\^(){}\*#]"
"syn match   fastaString      "[a-zA-Z_.]"


hi def link fastaRecord      Normal
hi def link fastaComment     Comment

"hi def link fastaHeaderStart Identifier
"hi def link fastaName        Constant
"hi def link fastaString      Type
"hi def link fastaNumber      Number
"hi def link fastaOperator    Operator

let b:current_syntax = 'fasta'
