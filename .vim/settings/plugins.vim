if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/bundle')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/IndexedSearch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'junegunn/goyo.vim', {'cmd': 'Goyo'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'rk1/snipmate-snippets'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'f-person/auto-dark-mode.nvim'
call plug#end()

if has('nvim')
    inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ?
        \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    "let g:coc_snippet_next = '<tab>'

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
    autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

    " Use <M-space> to trigger completion.
    "inoremap <silent><expr> <M-space> coc#refresh()

    " Navigate diagnostics
    nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
    nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Diagnostics
    " nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " Remap for format selected region
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  :CocFix<cr>

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    "coc-prettier
    command! -nargs=0 Prettier :CocCommand prettier.formatFile

    autocmd ColorScheme *
      \ hi CocWarningHighlight guibg=#909020
      \ | hi CocInfoHighlight guibg=#209020

    let g:coc_global_extensions = [
          \'coc-tsserver',
          \'coc-eslint',
          \'coc-snippets',
          \'coc-prettier',
          \'coc-rust-analyzer'
          \]
endif

"easymotion
let g:EasyMotion_smartcase = 1
map <Leader> <Plug>(easymotion-prefix)
nmap f <Plug>(easymotion-s)
nmap s <Plug>(easymotion-overwin-f2)

"NERDTree
let g:NERDTreeMinimalMenu=1

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

"fzf
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Ag<CR>
nnoremap <C-b> :Buffers<CR>

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>,
    \ {'options': '--layout=reverse --delimiter : --nth 4..', 'window': { 'width': 0.8, 'height': 0.8 }}, <bang>0)

autocmd CompleteDone * pclose

"fzf-checkout
let g:fzf_checkout_git_options = '--sort=-committerdate'

"fugitive & git
autocmd User Fugitive command! -bar -bang -buffer Gpushup Gpush<bang> -u origin HEAD

nnoremap <Leader>gs :vert Git<CR>
nnoremap <Leader>gb :GBranches --locals<CR>

"commentary
nmap <leader>c <Plug>CommentaryLine

"auto-pairs
let g:AutoPairsShortcutToggle = ''

"javascript
autocmd FileType typescriptreact setlocal commentstring={/*\ %s\ */}

"jsx
let g:jsx_pragma_required = 1


"auto-dark-mode
if has('nvim')
    lua require'auto-dark-mode'.setup()
endif

