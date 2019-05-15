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
set nohlsearch
set foldmethod=indent
set foldlevelstart=99
set completeopt-=preview
set signcolumn=yes
set nobackup
set nowritebackup

"smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

"use system clipboard
set clipboard=unnamed
set clipboard-=autoselect
set guioptions-=a

"put all swap files in one place
set directory^=$HOME/.vimswaps/

"colorscheme
set background=light
colorscheme solarized
call togglebg#map("<F5>")
highlight LineNr ctermfg=grey ctermbg=white
highlight SignColumn ctermfg=grey ctermbg=white
highlight CursorLineNr ctermfg=DarkGray ctermbg=white

"use vertical split for diffing
set diffopt+=vertical

set laststatus=2
set statusline=%f%m%=%{coc#status()}

" javascript
au BufRead,BufNewFile *.js set filetype=javascript.jsx
au BufEnter *.js set fo-=c fo-=r fo-=o
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
