-- Set leader key to comma
vim.g.mapleader = ","

-- Basic mappings
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "_", "<C-x>")
vim.keymap.set("n", "<CR>", "G")
vim.keymap.set("n", "<Space>", "za")

-- Difference navigation
vim.keymap.set("n", "]]", "]c")
vim.keymap.set("n", "[[", "[c")

-- Window navigation
vim.keymap.set("n", "<C-M-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-M-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- Buffer navigation
vim.keymap.set("n", "gp", ":e#<CR>")

-- Line navigation for wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Yank to end of line
vim.keymap.set("n", "Y", "y$")

-- Edit config
vim.keymap.set("n", "<leader>vr", ":ex ~/.config/nvim/<CR>")
