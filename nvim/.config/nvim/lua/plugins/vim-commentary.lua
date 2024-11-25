return {
  'tpope/vim-commentary',
  config = function()
    vim.keymap.set('n', '<leader>c', '<Plug>CommentaryLine', { remap = true })
  end
}
