return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			fzf_colors = true,
			buffers = {
				winopts = {
					height = 0.3,
					width = 1.0,
					row = 1,
				},
			},
			lsp = {
				winopts = {
					height = 0.4,
					width = 1.0,
					row = 1,
				},
			},
			files = {
				actions = {
					["ctrl-i"] = function(selected, opts)
						opts.fd_opts = opts.fd_opts and opts.fd_opts:match("--hidden") and "" or "--hidden --no-ignore"
						fzf.files(opts)
					end,
				},
			},
		})

		vim.keymap.set("n", "<C-f>", fzf.grep_project)
		vim.keymap.set("n", "<C-b>", fzf.buffers)
		vim.keymap.set("n", "<C-p>", fzf.files)
	end,
}
