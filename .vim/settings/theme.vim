set background=light
colorscheme solarized
call togglebg#map("<F5>")

hi SignColumn ctermbg=lightgray

" MacVim prefs
if has("gui_macvim")
    set vb
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
    set macmeta
    set guifont=Operator\ Mono\ Book:h17
    set linespace=4
endif

