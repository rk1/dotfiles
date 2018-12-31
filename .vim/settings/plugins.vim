if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/bundle')
Plug 'w0rp/ale'
Plug 'easymotion/vim-easymotion'
Plug 'Townk/vim-autoclose'
Plug 'ervandew/supertab'
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/IndexedSearch'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/matchit.zip'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'rk1/snipmate-snippets'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'reasonml-editor/vim-reason-plus', { 'for': 'reason' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'steelsojka/deoplete-flow'

call plug#end()

"ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_global = 1
let g:ale_fixers = {
\   'reason': ['refmt'],
\   'javascript': ['prettier'],
\}

"easymotion
let g:EasyMotion_smartcase = 1
map <Leader> <Plug>(easymotion-prefix)
nmap f <Plug>(easymotion-s)
nmap s <Plug>(easymotion-overwin-f2)

"NERDTree
if !exists("*NerdToggleFind")
    function NerdToggleFind()
        if &filetype == 'nerdtree'
            :NERDTreeToggle
        else
            :NERDTreeFind
        endif
    endfunction
endif

nnoremap <C-s> :call NerdToggleFind()<CR>
let NERDTreeQuitOnOpen=1

"UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"

"fzf
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :Ag<CR>
nnoremap <C-b> :Buffers<CR>
let g:fzf_action = {
      \ 'ctrl-o': 'open' }
let g:fzf_layout = { 'down': '~25%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

"SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCrMapping = 1

"Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.javascript = ['LanguageClient']

let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}
autocmd CompleteDone * pclose

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction
let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
if g:flow_path != 'flow not found'
  let g:deoplete#sources#flow#flow_bin = g:flow_path
endif

"Commentary
nmap <leader>c <Plug>CommentaryLine

"fugitive & git
nnoremap <leader>gd :!git diff<CR>
nnoremap <leader>gs :Gstatus<CR>

"javascript
let g:javascript_plugin_flow = 1

"jsx
let g:jsx_pragma_required = 1

"closetag
let g:closetag_filenames = '*.html,*.js,*.jsx'

"vim-go
let g:go_metalinter_enabled = []
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_fmt_fail_silently = 1
let g:go_metalinter_autosave = 0

"LanguageClient
nnoremap <silent> <cr> :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
