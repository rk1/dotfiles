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

"ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>a :Ack

"jsx
let g:jsx_pragma_required = 1

"flow
let g:flow#autoclose = 1

