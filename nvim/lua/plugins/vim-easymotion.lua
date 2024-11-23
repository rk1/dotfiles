return {
  'easymotion/vim-easymotion',
  config = function()
    vim.g.EasyMotion_smartcase = 1
    vim.api.nvim_set_keymap('n', '<Leader>', '<Plug>(easymotion-prefix)', {})
    vim.api.nvim_set_keymap('n', 'f', '<Plug>(easymotion-s)', {})
    vim.api.nvim_set_keymap('n', 's', '<Plug>(easymotion-overwin-f2)', {})
  end
}
