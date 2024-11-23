return {
  'junegunn/fzf.vim',
  dependencies = { 'junegunn/fzf', dir = "~/.fzf", build = "./install --all" },
  config = function()
    vim.g.fzf_layout = { down = '~30%' }
    vim.g.fzf_history_dir = '~/.local/share/fzf-history'
    
    vim.keymap.set('n', '<C-p>', ':Files<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<C-f>', ':Ag<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<C-b>', ':Buffers<CR>', { noremap = true, silent = true })
    
    -- Custom Ag command
    vim.api.nvim_create_user_command('Ag', function(opts)
      local bang = opts.bang and '!' or ''
      local query = opts.args
      vim.fn['fzf#vim#ag'](query, {
        options = '--layout=reverse --delimiter : --nth 4..',
        window = { width = 0.8, height = 0.8 }
      }, bang == '!')
    end, { nargs = '*', bang = true })
    
    -- Auto close preview window after completion
    vim.api.nvim_create_autocmd('CompleteDone', {
      pattern = '*',
      command = 'pclose'
    })
  end
}
