"SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCrMapping = 1

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

"Commentary
nmap <leader>c <Plug>CommentaryLine

"fugitive & git
nnoremap <leader>gd :!git diff<CR>

"magit
nnoremap <leader>gs :MagitOnly<CR>
let g:magit_default_fold_level = 2

"fzf
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :Ag<CR>
nnoremap <C-b> :Buffers<CR>
let g:fzf_action = {
      \ 'ctrl-o': 'open' }
let g:fzf_layout = { 'down': '~25%' }
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

"javascript
let g:javascript_plugin_flow = 1

"jsx
let g:jsx_pragma_required = 1

"closetag
let g:closetag_filenames = '*.html,*.js,*.jsx'

"easymotion
let g:EasyMotion_smartcase = 1
map <Leader> <Plug>(easymotion-prefix)
nmap f <Plug>(easymotion-s)
nmap s <Plug>(easymotion-overwin-f2)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

"ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_global = 1
let g:ale_linters = {
\   'javascript': ['flow'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\}

"vim-go
let g:go_metalinter_enabled = []
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_fmt_fail_silently = 1
let g:go_metalinter_autosave = 0

