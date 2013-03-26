set nocompatible      " Running Vim, not Vi!
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set cindent
set smartindent
set ignorecase
set smartcase
set autoindent
set guioptions=aAce
set modelines=0

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
filetype plugin indent on

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Theme stuff
set background=light
colorscheme solarized
let g:solarized_contrast="medium"
let g:solarized_visibility="medium"
let g:solarized_bold = 0
call togglebg#map("<F5>")
let g:vimroom_guibackground = '#fdf6e3'
nnoremap <F4> :VimroomToggle<CR>

" MacVim prefs
if has("gui_macvim")
    set vb
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
    set macmeta
    set guifont=Inconsolata:h17
    set linespace=4
endif

" mouse stuff
set mousehide

"use comma for a leader key
let mapleader = ","
"escape is too far 
:imap jj <Esc>
"a shift less
nnoremap ; :
"easier increment/decrement
nnoremap + <C-a>
nnoremap _ <C-x>
"map comment key
map <D-/> gcc
"easier go to line
:nmap <CR> G
"new vert split and switch to it
nnoremap <leader>w <C-w>v<C-w>l
"faster quotes manipulation
map ciq ci"
map caq ca"

"Use control-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>

"use system clipboard
set clipboard=unnamed

"cmd+number for tabs
map <D-1> :tabn 1<CR>
map <D-2> :tabn 2<CR>
map <D-3> :tabn 3<CR>
map <D-4> :tabn 4<CR>
map <D-5> :tabn 5<CR>
map <D-6> :tabn 6<CR>
map <D-7> :tabn 7<CR>
map <D-8> :tabn 8<CR>
map <D-9> :tabn 9<CR>

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

"add jquery snippets for js files as well
au BufRead,BufNewFile *.js set ft=javascript syntax=jquery

"open file under cursor in a tab by default
map gf <c-w>gf

"NERDTree
nmap <D-D> :execute 'NERDTreeToggle'<CR> 
set autochdir
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2

"SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:ctrlp_prompt_mappings = {
            \ 'AcceptSelection("e")': ['<c-t>'],
            \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
            \ }

"CtrlP
let g:ctrlp_map = '<c-p>'

"indent 
map   <silent> <leader>aa mmgg=G`m^zz
imap   <silent> <leader>aa mmgg=G`m^zz

"put all swap files together in one place
set directory^=$HOME/.swapsvim//

"better html li indent
:let g:html_indent_inctags = "li,ul"
"open html in safari
nmap <leader>sf :!open % -a Safari<CR><CR>

"ruby
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
map <Leader>r :w! <bar> !ruby %<CR>

" Edit and reload .vimrc
nmap <leader>vr :tabedit $MYVIMRC<CR>
map <silent> <leader>vrr :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
