" Vanilla vimrc
filetype plugin indent on
syntax on

set t_Co=256
colorscheme ayu

" Loading and viewing
set autochdir
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set clipboard=unnamedplus
set colorcolumn=80
set complete-=i
set cursorline
set display=lastline,truncate
set formatoptions+=j
set hidden
set hlsearch
set ignorecase smartcase
set incsearch
set laststatus=2
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set magic
set matchtime=3
set mouse=a
set nocompatible
set nowrap
set number
set omnifunc=syntaxcomplete#Complete
set ruler
set sessionoptions-=option
set showcmd
set showmatch
set sidescrolloff=2
set sidescroll=1
set switchbuf=useopen,usetab
set tags=./tags;/,tags;/
set ttyfast
set ttyscroll=3
set termguicolors
set viewoptions-=options
set wildmenu
set wildmode=list:longest
 
" Tabs
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Backup and persistent undo
au BufWritePre * let &bex = '-' . strftime("%m%d%Y-%H%M%S") . '.vim.bak'
set backup
set undofile
set directory=$HOME/.vim/swap//
set backupdir=$HOME/.vim/backup//
set undodir=$HOME/.vim/undo//

" Create directories if needed
if !isdirectory(expand(&directory))
	call mkdir(expand(&directory), "p")
endif

if !isdirectory(expand(&backupdir))
	call mkdir(expand(&backupdir), "p")
endif

if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir), "p")
endif

" Correctly highlight $() and other modern affordances in filetype=sh.
let g:is_posix = 1

" Make grep commands open a quickfix window
autocmd QuickFixCmdPost *grep* cwindow

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"zz" |
     \ endif

" Tab completion 
inoremap <expr> <Tab> getline('.')[col('.')-2] !~ '^\s\?$' \|\| pumvisible()
			\ ? '<C-N>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() \|\| getline('.')[col('.')-2] !~ '^\s\?$'
			\ ? '<C-P>' : '<Tab>'
autocmd CmdwinEnter * inoremap <expr> <buffer> <Tab>
			\ getline('.')[col('.')-2] !~ '^\s\?$' \|\| pumvisible()
			\ ? '<C-X><C-V>' : '<Tab>'

" Map leader to space
let mapleader = " "
let g:mapleader = " "
nnoremap <Space> <nop>

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Center search results
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" Clear highlight with leader enter
nnoremap <silent> <leader><cr> :noh<cr>


