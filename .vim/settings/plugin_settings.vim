"SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCrMapping = 1

"NERDTree
nnoremap <C-s> :NERDTreeFind<CR>
nnoremap <C-a> :NERDTreeToggle<CR>

"Commentary
nmap <leader>c <Plug>CommentaryLine

"fugitive & git
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :!git diff<CR>

"fzf
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :Ag<CR>
nnoremap <C-b> :Buffers<CR>
let g:fzf_action = {
      \ 'ctrl-o': 'open' }
let g:fzf_layout = { 'down': '~25%' }

"jsx
let g:jsx_pragma_required = 1

"easymotion
let g:EasyMotion_smartcase = 1
map <Leader> <Plug>(easymotion-prefix)
nmap f <Plug>(easymotion-s)
nmap s <Plug>(easymotion-overwin-f2)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_fix_on_save = 1
" let g:ale_lint_on_text_changed = "never"
" let g:ale_sign_column_always = 1
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
let g:ale_javascript_prettier_use_global = 1
let g:ale_javascript_prettier_options = "--print-width 100 --single-quote --trailing-comma es5"
let g:ale_linters = {
\   'javascript': ['flow'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\}
