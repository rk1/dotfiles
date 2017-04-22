"use comma for a leader key
let mapleader = ","

"escape is too far
:imap jj <Esc>

"a shift less
nnoremap ; :

"easier increment/decrement
nnoremap + <C-a>
nnoremap _ <C-x>

"comment toggle
map <D-/> :TComment<CR>
map <leader>c :TComment<CR>

"easier go to line
:nmap <CR> G

"fold toggle
nnoremap <Space> za

"change to current directory
nnoremap ,cd :cd %:p:h<CR>

"yank to end of line
noremap Y y$

"splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

"TextMate-like cmd+enter
imap <D-CR> <Esc>o
imap <D-S-CR> <Esc>O
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
nmap <leader>vr :tabedit $MYVIMRC<CR>
map <silent> <leader>vrr :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

