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
set nobackup
set nowritebackup
set incsearch

"smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  " set signcolumn=yes
  set signcolumn=no
endif

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

"cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" Optionally reset the cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

"use vertical split for diffing
set diffopt+=vertical

set laststatus=2
if has('nvim')
    set statusline=%f%m%=%{coc#status()}
endif

" javascript
au BufRead,BufNewFile *.js set filetype=javascript.jsx
au BufEnter *.js set fo-=c fo-=r fo-=o
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType javascript.jsx setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript.tsx setlocal ts=2 sts=2 sw=2
autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2
