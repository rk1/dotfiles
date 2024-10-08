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

" Always show the signcolumn
set signcolumn=number

"use system clipboard
set clipboard=unnamed
set clipboard-=autoselect
set guioptions-=a

"put all swap files in one place
set directory^=$HOME/.vimswaps/

"colorscheme
set background=light
try
    colorscheme solarized
catch
endtry

"TODO: maybe it's safe to remove those
" highlight diffAdded guifg=#859900
" highlight diffRemoved guifg=#cc4f1a

" highlight LineNr ctermfg=grey ctermbg=white
" highlight SignColumn ctermfg=grey ctermbg=white
" highlight CursorLineNr ctermfg=DarkGray ctermbg=white

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
    set statusline=%f%m%=%{FugitiveStatusline()}%{coc#status()}
endif

" javascript
au BufRead,BufNewFile *.js set filetype=javascript.jsx
au BufEnter *.js set fo-=c fo-=r fo-=o
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType javascript.jsx setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript.tsx setlocal ts=2 sts=2 sw=2
autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2
