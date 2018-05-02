set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set hidden
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
set completeopt-=preview

"use system clipboard
set clipboard=unnamed
set clipboard-=autoselect
set guioptions-=a

"statusline
set laststatus=2
set statusline=%f%m%=%P

"put all swap files in one place
set directory^=$HOME/.vimswaps/

filetype plugin indent on
syntax on

"theme
set background=light
colorscheme solarized
call togglebg#map("<F5>")
