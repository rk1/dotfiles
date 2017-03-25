au BufRead,BufNewFile *.js set filetype=javascript.jsx
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.hbs set filetype=html

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

"use prettier as a javascript formatter
autocmd FileType javascript set formatprg=prettier\ --stdin
"autocmd FileType javascript set formatprg=prettier\ --stdin\ --print-width 100\ --single-quote\ --trailing-comma all

"better html li indent
let g:html_indent_inctags = "li,ul"

