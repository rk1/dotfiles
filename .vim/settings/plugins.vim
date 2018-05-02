if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'Townk/vim-autoclose'
Plug 'garbas/vim-snipmate'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'bronson/vim-trailing-whitespace'
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdtree'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/tlib'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/matchit.zip'
Plug 'w0rp/ale'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'junegunn/goyo.vim'
Plug 'rk1/snipmate-snippets'
call plug#end()
