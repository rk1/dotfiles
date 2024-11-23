return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<Leader>gs', ':vert Git<CR>')
  end
}
