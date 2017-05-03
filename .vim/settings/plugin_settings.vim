"SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCrMapping = 1

"Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 8
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': ['html', 'hbs'] }
nnoremap <Leader>e :SyntasticCheck<CR> :SyntasticToggleMode<CR>

"NERDTree
nnoremap <C-s> :NERDTreeFind<CR>
nnoremap <C-a> :NERDTreeToggle<CR>

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

"flow
let g:flow#autoclose = 1

"Neoformat
 let g:neoformat_javascript_prettier = {
     \ 'exe': 'prettier',
     \ 'args': ['--print-width 100', '--single-quote', '--stdin', '--trailing-comma all'],
     \ 'stdin': 1,
     \ }

let g:neoformat_enabled_javascript = ['prettier']

map <leader>ff :Neoformat<cr>
autocmd BufWritePre *.js Neoformat

