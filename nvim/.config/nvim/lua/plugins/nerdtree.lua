return {
  'preservim/nerdtree',
  config = function()
    vim.g.NERDTreeMinimalMenu = 1
    vim.g.NERDTreeQuitOnOpen=1

    vim.api.nvim_create_user_command('NerdToggleFind', function()
      if vim.bo.filetype == 'nerdtree' then
        vim.cmd('NERDTreeToggle')
      else
        vim.cmd('NERDTreeFind')
      end
    end, {})
    vim.keymap.set('n', '<C-s>', ':NerdToggleFind<CR>')
  end
}
