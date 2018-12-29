"use comma for a leader key
let mapleader = ","

"escape is too far
:imap jj <Esc>

"a shift less
nnoremap ; :

"easier increment/decrement
nnoremap + <C-a>
nnoremap _ <C-x>

"easier go to line
:nmap <CR> G

"fold toggle
nnoremap <Space> za

" easier difference navigation
map ]] ]c
map [[ [c

"yank to end of line
noremap Y y$

"splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

"buffers
map gp :e#<cr>

"TextMate-like braces
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap (<cr> (<cr>)<c-o>O<tab>

"include dash or not?
set iskeyword=@,48-57,_,192-255,#,-
nnoremap <expr> <F6> ':set isk' . (index(split(&isk, ','), '-') == -1 ? '+' : '-') . '=-<cr>:set iskeyword?<cr>'

"indent
map <silent> <leader>aa mmgg=G`m^zz
imap <silent> <leader>aa mmgg=G`m^zz

" Edit and reload .vimrc
nmap <leader>vr :ex ~/.vim/settings/<CR>
map <silent> <leader>vrr :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
