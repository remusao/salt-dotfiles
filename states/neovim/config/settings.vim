" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Python path with neovim package installed
let g:python3_host_prog = '/home/remi/.virtualenvs/neovim3/bin/python'
let g:python_host_prog = '/home/remi/.virtualenvs/neovim2/bin/python'

set title           " Change terminal's title
set number          " show line numbers
set history=100     " keep N lines of command line history
set showcmd         " display incomplete commands
set noshowmode      " disable showmode because of Powerline
set gdefault        " Set global flags for search and replace
set cursorline!     " disable: underline the current line, for quick orientation
set smartcase       " ignore case if search pattern is all lowercase, case-sensitive otherwise
set ignorecase      " ignore case when searching
set inccommand=nosplit

"" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

set showmatch       " set show matching parenthesis

" Set encoding
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix

set wrap linebreak nolist
set lazyredraw                      " don't update the display while executing macros
set hidden                          " Hide buffers in background

" Disable automatic wrapping.
set textwidth=0

" Don't store swap files
set nobackup
set noswapfile
set nowritebackup

" Reduce processing for syntax highlighting to make it less of a pain.
set synmaxcol=1000
syntax sync minlines=200
syntax sync maxlines=2000

" Persistent undo
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" Set the right margin.
set colorcolumn=80

" Automatically re-open files after they have changed without prompting.
" This can be a little more destructive, but a lot less annoying.
set autoread

" Indentation
set tabstop=4       " default to 4 spaces for a hard tab
set softtabstop=4   " default to 4 spaces for the soft tab
set shiftwidth=4    " for when <TAB> is pressed at the beginning of a line
set expandtab       " Expand tabs into spaces
set smartindent
set nofoldenable
set autoindent      " always set autoindenting on
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'

set hlsearch is     " highlight search terms

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set ruler               " show the cursor position all the time
set incsearch           " do incremental searching
set splitright          " Vertical splits use right half of screen

set timeout
set timeoutlen=1000      " Lower ^[ timeout
set ttimeout
set ttimeoutlen=10

if exists('breakindent')
    set breakindent " Indent wrapped lines up to the same level
endif

" Ignore this extension in file searching
set wildignore=*.swp,*.bak,*.pyc,*.class,*.so,*.zip,.git,.cabal-sandbox

" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest

" Always copy in clipboard
set clipboard+=unnamedplus

" Reveal already opened files from other tabs
set switchbuf=useopen

" Completion in bottom menu
set wildmode=list:longest,full
set wildmenu " make tab completion for files/buffers act like bash

"" Git commit preference
autocmd Filetype gitcommit setlocal spell textwidth=80

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ execute "normal! g`\"" |
            \ endif
