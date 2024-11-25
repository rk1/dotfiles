return {
  'stsewd/fzf-checkout.vim',
  config = function()
    vim.g.fzf_checkout_git_options = '--sort=-committerdate'
    vim.keymap.set('n', '<Leader>gb', ':GBranches --locals<CR>', { noremap = true, silent = true })
  end
}
