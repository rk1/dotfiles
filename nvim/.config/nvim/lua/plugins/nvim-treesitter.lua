local parsers = {
	"css",
	"html",
	"javascript",
	"json",
	"lua",
	"tsx",
	"typescript",
	"vim",
}

local filetypes = {
	"css",
	"html",
	"javascript",
	"javascriptreact",
	"json",
	"lua",
	"typescript",
	"typescriptreact",
	"vim",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	-- The main branch does not support lazy-loading.
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install(parsers)

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
			pattern = filetypes,
			desc = "Enable treesitter highlighting and folding",
			callback = function()
				if not pcall(vim.treesitter.start) then
					return
				end

				vim.wo[0][0].foldmethod = "expr"
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
			end,
		})
	end,
}
