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

filetype plugin indent on
syntax on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'Townk/vim-autoclose.git'
Bundle 'garbas/vim-snipmate'
Bundle 'itspriddle/vim-jquery'
Bundle 'ervandew/supertab'
Bundle 'tomtom/tcomment_vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'scrooloose/nerdtree'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-ruby/vim-ruby'
Bundle 'goldfeld/vim-seek'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'vim-scripts/tlib'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'flowtype/vim-flow'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'vim-scripts/matchit.zip'
Bundle 'scrooloose/syntastic'
Bundle 'Shutnik/jshint2.vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'rk1/snipmate-snippets'


" Theme stuff
if has("gui_running")
    set background=light
    colorscheme solarized
    let g:solarized_contrast="medium"
    let g:solarized_visibility="medium"
    let g:solarized_bold = 0
    call togglebg#map("<F5>")
    " toggle menu
    nnoremap <A-m> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
endif

" MacVim prefs
if has("gui_macvim")
    set vb
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
    set macmeta
    set guifont=Operator\ Mono\ Book:h17
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
map <D-/> :TComment<CR>
map <leader>c :TComment<CR>
"easier go to line
:nmap <CR> G
"folding
set foldmethod=indent
set foldlevelstart=99
nnoremap <Space> za
"change to current directory
nnoremap ,cd :cd %:p:h<CR>
"yank to end of line
noremap Y y$

"use system clipboard
set clipboard=unnamed
set clipboard-=autoselect
set guioptions-=a

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

"prev/next tab
" nnoremap <C-j> :tabprevious<CR>
" nnoremap <C-k> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

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

"filetype/syntax for other files
au BufRead,BufNewFile *.js set filetype=javascript.jsx
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.hbs set filetype=html

"jsx
let g:jsx_pragma_required = 1

"flow
let g:flow#autoclose = 1

map <leader>ff :call JsBeautify()<cr>

"open file under cursor in a tab by default
map gf <c-w>gf

"SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCrMapping = 1

"CtrlP
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|dist|tmp|vendor)|(\.(git|svn))$'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<cr>'],
    \ 'AcceptSelection("t")': ['<D-cr>', '<c-t>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<c-n>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<c-p>'],
\}
let g:ctrlp_use_caching = 0
let g:ctrlp_root_markers = ['package.json']
if executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
  " and .agignore. Ignores hidden files by default.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
  "ctrl+p ignore files in .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

"syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 8
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': ['html', 'hbs'] }

nnoremap <Leader>e :SyntasticCheck<CR> :SyntasticToggleMode<CR>
nnoremap <C-s> :NERDTreeFind<CR>
nnoremap <C-a> :NERDTreeToggle<CR>

"Statusline
set laststatus=2
set statusline+=%f%m%=%P
hi statusline guibg=#7c7b82 ctermfg=6 guifg=#fdf6e3 ctermbg=0

"indent
map <silent> <leader>aa mmgg=G`m^zz
imap <silent> <leader>aa mmgg=G`m^zz

"better html li indent
let g:html_indent_inctags = "li,ul"
"open html in safari
nmap <leader>sf :!open % -a Safari<CR><CR>

"put all swap files together in one place
set directory^=$HOME/.swapsvim/

"mustache
let g:mustache_abbreviations = 1

"ruby
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

map <Leader>r :w! <bar> !ruby %<CR>

" Edit and reload .vimrc
nmap <leader>vr :tabedit $MYVIMRC<CR>
map <silent> <leader>vrr :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

