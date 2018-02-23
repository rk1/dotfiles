"SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCrMapping = 1

"NERDTree
function NerdToggleFind()
    if &filetype == 'nerdtree'
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction

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
