set nocompatible
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set relativenumber
set cindent
set smartindent
set ignorecase
set smartcase
set autoindent
set guioptions=aAce
set modelines=0
set ff=unix
set mousehide
set foldmethod=indent
set foldlevelstart=99

"use system clipboard
set clipboard=unnamed
set clipboard-=autoselect
set guioptions-=a

"statusline
set laststatus=2
set statusline+=%f%m%=%P

"put all swap files in one place
set directory^=$HOME/.vimswaps/

filetype plugin indent on
syntax on
