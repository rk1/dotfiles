let s:vim_home = '~/.vim/settings/'

let config_list = [
  \ 'base.vim',
  \ 'plugins.vim',
  \ 'plugin_settings.vim',
  \ 'keymappings.vim',
  \ 'theme.vim',
  \ 'languages.vim'
\]

for files in config_list
  for f in split(glob(s:vim_home.files), '\n')
    exec 'source '.f
  endfor

endfor
