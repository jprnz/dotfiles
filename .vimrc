" Minimal vimrc
filetype plugin indent on
silent! runtime macros/matchit.vim " matchit comes with Vim
syntax on                          " syntax highlighting

" Loading and viewing
set autoindent                     " auto indent
set autoread                       " detect changes to file
set backspace=indent,eol,start     " let the backspace key work normally
set clipboard=unnamed              " allow clipping
set hidden                         " hide unsaved buffers
set laststatus=2                   " not strictly necessary but good for consistency
set nocompatible                   " not strictly necessary but useful in some situations
set nowrap                         " please dont wrap text
set number                         " line numbers
set ruler                          " shows line number in the status line
set switchbuf=useopen,usetab       " better behavior for the quickfix window and :sb
set tags=./tags;/,tags;/           " search tags files efficiently
set wildmenu                       " better command line completion, shows a list of matches
set wildmode=list:longest          " verbose completions

" Search highlight and competion
set complete-=i                    " ignore case
set hlsearch                       " highlight searchs
set incsearch                      " incremental search rules

" Tabs
set smarttab                       " use smart tabs
set shiftwidth=2                   " space for autoindent
set softtabstop=2                  " soft tabs
set tabstop=2                      " tab stop

" Backup and persistent undo
au BufWritePre * let &bex = '-' . strftime("%m%d%Y-%H%M%S") . '.vim.bak'
set backup                         " make backup files
set undofile                       " persistent undo
set directory=$HOME/.vim/swap//    " location of swap
set backupdir=$HOME/.vim/backup//  " location of backups
set undodir=$HOME/.vim/undo//      " locaiton of undo files

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
