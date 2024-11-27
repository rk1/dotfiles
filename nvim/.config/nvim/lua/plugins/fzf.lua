return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    
    fzf.setup({
      buffers = {
        winopts = {
          height = 0.3,
          width = 1.0,
          row = 1,
        }
      }
    })
    
    -- Global keymaps
    vim.keymap.set('n', '<C-f>', fzf.grep_visual)
    vim.keymap.set('n', '<C-b>', fzf.buffers)
    vim.keymap.set('n', '<C-p>', fzf.files)
  end
}
