return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')
    
    -- State for hidden files toggle
    local show_hidden = false
    
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-h>"] = function()
              show_hidden = not show_hidden
              builtin.find_files({ hidden = show_hidden })
            end,
          },
        },
      },
    })
    
    -- Pickers
    vim.keymap.set('n', '<C-p>', function()
      builtin.find_files({ hidden = show_hidden })
    end)
    vim.keymap.set('n', '<C-f>', builtin.live_grep)
    vim.keymap.set('n', '<C-b>', function()
      builtin.buffers({
        layout_strategy = "bottom_pane",
      })
    end)
    vim.keymap.set("n", "<leader>gb", function()
      builtin.git_branches({
        show_remote_tracking_branches = false,
        layout_strategy = "bottom_pane",
      })
    end)
  end
}
