return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 
        "lua", "vim",
        "javascript", "typescript", "tsx",
        "json", "html", "css",
        "markdown", "yaml"
      },
      highlight = {
        enable = true,
      }
    }
  end
}
