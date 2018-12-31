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

"statusline
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '[OK]' : printf(
    \   '[%dW %dE]',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
set laststatus=2
set statusline=%f%m%=%{LinterStatus()}

" javascript
au BufRead,BufNewFile *.js set filetype=javascript.jsx
au BufEnter *.js set fo-=c fo-=r fo-=o
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
