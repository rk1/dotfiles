-- Basic editor settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.hidden = true
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cindent = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.modelines = 0
vim.opt.fileformat = "unix"
vim.opt.hlsearch = false
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99
vim.opt.completeopt:remove("preview")
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.incsearch = true

-- Update time and messages
vim.opt.updatetime = 300
vim.opt.shortmess:append("c")
vim.opt.signcolumn = "number"

-- Cursor settings
vim.opt.guicursor = {
	"n-v-c:block-Cursor/lCursor-blinkon0",
	"i-ci:ver25-Cursor/lCursor",
	"r-cr:hor20-Cursor/lCursor",
}

-- Diff settings
vim.opt.diffopt:append("vertical")

-- Clipboard settings
vim.opt.clipboard = "unnamed"

-- Visual mode paste without overwriting register
vim.keymap.set("v", "<leader>p", '"_dP')

-- iskeyword settings
vim.opt.iskeyword = "@,48-57,_,192-255,#,-"

-- Swap files directory
vim.opt.directory = vim.fn.expand("$HOME/.vimswaps//")

-- Split settings
vim.opt.splitbelow = true
vim.opt.splitright = true

-- JavaScript/TypeScript file settings
local function set_js_settings()
	vim.bo.formatoptions = vim.bo.formatoptions:gsub("c", ""):gsub("r", ""):gsub("o", "")
	vim.bo.tabstop = 2
	vim.bo.softtabstop = 2
	vim.bo.shiftwidth = 2
end

local js_group = vim.api.nvim_create_augroup("JavaScriptSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = js_group,
	pattern = { "javascript", "javascript.jsx", "typescript", "typescript.tsx", "typescriptreact" },
	callback = set_js_settings,
})
