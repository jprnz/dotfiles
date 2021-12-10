let $TMPDIR = $HOME."/.vim/tmp"

"---Plugins
call plug#begin()
Plug 'junegunn/vim-plug'

" Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Edit
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'gcmt/wildfire.vim'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-sandwich'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" Languages
Plug 'snakemake/snakemake', {'rtp': 'misc/vim/'}
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" UI and Navigation
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'jpalardy/vim-slime'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/tmux-complete.vim'

" Finder
Plug 'Yggdroot/LeaderF'
"Plug 'ctrlpvim/ctrlp.vim'

" Enable Vundel and re-enable filetype things
call plug#end()

" -- Colors
colorscheme grb256
hi! link TabLine Comment
hi! link TabLineFill NonText
hi! link TabLineSel Special
hi! link Folded Cursor
hi! link FoldColumn Directory
hi! ColorColumn guibg=#121212 ctermbg=234

" -- Options
set autochdir                  " Automatically cd into directory of file
set autoread                   " Automatically pull in changes
set backspace=eol,start,indent " Allow backspace over features
set clipboard=unnamedplus      " Add X clip support set cmdheight=1                " Number of lines for command-line
set colorcolumn=80             " Colorcolumn set to n-chars
set cursorline                 " Highlight cursorline
set encoding=utf8              " Ensure UTF8
set ffs=unix,dos,mac           " File format priority
set fillchars=diff:\ ,vert:│   " Diff separator
set hidden                     " Don't abandon unloaded buffers
set history=10000              " History to remember
set hlsearch                   " Highlight search results
set ignorecase                 " When searching
set incsearch                  " Highlight as
set lazyredraw                 " Don't redraw while executing macros
set linespace=0                " Space between lines
set magic                      " Allow special characters in regular expressions
set mat=3                      " Tenths of a second to blink when matching brackets via showmatch
set mouse=a                    " Mouse support
set noerrorbells               " No audible bells
set novisualbell               " No visual bells
set number                     " Line numbering
set numberwidth=3              " n-char width of padding
set ruler                      " Display current position
set scrolloff=3                " Keep n-lines from scolling
set showcmd                    " Verbose when reading commands
set showmatch                  " Show matching brackets
set sidescrolloff=2            " Number of columns to include when side scrolling
set smartcase                  " When searching try to be smart about cases
set t_Co=256                   " Force 256 color mode
set ttyfast                    " Assume a fast terminal
set ttyscroll=3                " Play nice with tmux scolling in vertical split
set wildignore=*.o,*~,*.pyc    " Ignore patters in filenames
set wildmenu                   " Trun on wildmenu
set wildmode=list:longest      " Make wildmenu a list
set nolbr
set nowrap
set whichwrap=b,s,h,l,<,>,~,[,] " All

" -- Indent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set smartindent
set expandtab
set smarttab
set shiftround

" -- Backups
" Create directories
set backup
set undofile
set swapfile

for path in ["backup", "swap", "undo"]
  if !isdirectory($HOME . "/.vim/" . path)
      call mkdir($HOME . "/.vim/" . path, "p")
  endif
endfor

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
au BufWritePre * let &bex = '-' . strftime("%m%d%Y-%H%M%S") . '.vim.bak'

" -- LeaderF
let g:Lf_HideHelp = 0
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1

let g:Lf_ShowDevIcons = 0
let g:Lf_PreviewInPopup = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_StlSeparator = { 'left': "", 'right': "", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }


" -- Mappings
let mapleader = " "
let g:mapleader = " "
nnoremap <Space> <nop>

" Map F1 to Escape
map <F1> <Esc>  " Common typo
imap <F1> <Esc> " Common typo

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Fast saving
nmap <leader>w :w!<cr>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Clear highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Attempting to fix CAPS issues when not in insert mode
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" Kills caps when exiting insert mode
autocmd InsertLeave * set iminsert=0

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Make grep commands open a quickfix window
autocmd QuickFixCmdPost *grep* cwindow

" -- Status line
" Always show the status line
set laststatus=2
set statusline=                                " clear statusline
set statusline+=[b%n\]\                        " buffer number
set statusline+=%F\                            " file name
set statusline+=%h%m%r%w                       " flags
set statusline+=%=                             " right align
set statusline+=[%{strlen(&ft)?&ft:'none'}\|   " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}\|  " encoding
set statusline+=%{&fileformat}]\               " file format
set statusline+=[%l\|%c%V\|%P]\                " offset

" -- Editing mappings
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd FileType python,snakemake,nim autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileType python,snakemake,nim autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FileType python,snakemake,nim autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd FileType python,snakemake,nim autocmd BufWritePre     * :call TrimWhiteSpace()
nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>


" -- Spell checking
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" -- Functions
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


" Tagbar
let g:tagbar_left = 0

" Airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = "wombat"
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.linenr = 'LN'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_mode_map = {
	\ '__' : '-',
	\ 'n'  : 'N',
	\ 'i'  : 'I',
	\ 'R'  : 'R',
	\ 'c'  : 'C',
	\ 'v'  : 'V',
	\ 'V'  : 'V',
	\ '' : 'V',
	\ 's'  : 'S',
	\ 'S'  : 'S',
	\ '' : 'S',
\ }

" Correct commentstring for snakemake
autocmd FileType snakemake setlocal commentstring=#\ %s

" CSV Settings...
hi link CSVColumnOdd Title
hi link CSVColumnEven Visual
hi link CSVColumnHeaderOdd Todo
hi link CSVColumnHeaderEven Todo

"" NetRW Settings...
"let g:netrw_chgwin = 1
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"
"" Mappings for CtrlP
"nnoremap <leader>f :CtrlP<CR>
"nnoremap <leader>b :CtrlPBuffer<CR>
"nnoremap <leader>m :CtrlPMRUFiles<CR>
"nnoremap <leader>t :CtrlPTag<CR>
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Vim-Tmux-Navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\\> :TmuxNavigatePrevious<cr>

" Same for insert-mode
inoremap <silent> <c-h> <C-\><C-O>:TmuxNavigateLeft<cr>
inoremap <silent> <c-j> <C-\><C-O>:TmuxNavigateDown<cr>
inoremap <silent> <c-k> <C-\><C-O>:TmuxNavigateUp<cr>
inoremap <silent> <c-l> <C-\><C-O>:TmuxNavigateRight<cr>
inoremap <silent> <c-\\> <C-\><C-O>:TmuxNavigatePrevious<cr>

" Polyglot
" let g:polyglot_disabled = ['r']

" Vim-Slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": "{last}"}
let g:slime_python_ipython = 0
let g:slime_dont_ask_default = 1

" Git-Gutter
set updatetime=100
let g:gitgutter_terminal_reports_focus = 1
let g:gitgutter_set_sign_backgrounds = 0
highlight SignColumn ctermbg=black

" Gutentags
let g:gutentags_ctags_exclude = ["conda/*", ".snakemake/*"]
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]
