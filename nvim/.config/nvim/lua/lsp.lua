local function on_attach(client, bufnr)
	local function keymap(lhs, rhs, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end

	if client:supports_method("textDocument/definition") then
		keymap("gd", vim.lsp.buf.definition, "Go to definition")
	end

	if client:supports_method("textDocument/typeDefinition") then
		keymap("gy", vim.lsp.buf.type_definition, "Go to type definition")
	end

	if client:supports_method("textDocument/implementation") then
		keymap("gi", "<cmd>FzfLua lsp_implementations<cr>", "Go to implementation")
	end

	if client:supports_method("textDocument/references") then
		keymap("gr", "<cmd>FzfLua lsp_references<cr>", "Show references")
	end

	if client:supports_method("textDocument/hover") then
		keymap("K", vim.lsp.buf.hover, "Show hover documentation")
	end

	keymap("<C-k>", function()
		vim.diagnostic.jump({ count = -1 })
	end, "Previous diagnostic")
	keymap("<C-j>", function()
		vim.diagnostic.jump({ count = 1 })
	end, "Next diagnostic")

	if client:supports_method("textDocument/rename") then
		keymap("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	end

	if client:supports_method("textDocument/codeAction") then
		keymap("<leader>ac", "<cmd>FzfLua lsp_code_actions<cr>", "Code actions")
	end
end

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Diagnostic signs
local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "»" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Attach LSP keymaps when LSP attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Configure LSP keymaps",
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end
		on_attach(client, args.buf)
	end,
})

-- Set up LSP servers
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
	once = true,
	callback = function()
		-- Set up capabilities for blink-cmp
		local capabilities = require("blink-cmp").get_lsp_capabilities()
		vim.lsp.config("*", { capabilities = capabilities })

		-- Enable LSP servers from the config directory
		local server_configs = vim.iter(vim.fn.glob(vim.fn.stdpath("config") .. "/lsp/*.lua", true, true))
			:map(function(file)
				return vim.fn.fnamemodify(file, ":t:r")
			end)
			:totable()
		vim.lsp.enable(server_configs)
	end,
})
