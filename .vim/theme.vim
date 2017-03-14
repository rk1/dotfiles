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

