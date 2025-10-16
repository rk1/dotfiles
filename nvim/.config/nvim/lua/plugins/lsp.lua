local function setup_lsp_keymaps(client, bufnr)
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

	-- FzfLua for better UI/filtering
	if client:supports_method("textDocument/implementation") then
		keymap("gi", "<cmd>FzfLua lsp_implementations<cr>", "Go to implementation")
	end
	if client:supports_method("textDocument/references") then
		keymap("gr", "<cmd>FzfLua lsp_references<cr>", "Show references")
	end
	if client:supports_method("textDocument/codeAction") then
		keymap("<leader>ac", "<cmd>FzfLua lsp_code_actions<cr>", "Code actions")
	end

	if client:supports_method("textDocument/hover") then
		keymap("K", vim.lsp.buf.hover, "Show hover documentation")
	end
	if client:supports_method("textDocument/rename") then
		keymap("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	end

	keymap("<C-k>", function()
		vim.diagnostic.jump({ count = -1 })
	end, "Previous diagnostic")
	keymap("<C-j>", function()
		vim.diagnostic.jump({ count = 1 })
	end, "Next diagnostic")
end

return {
	-- Mason: LSP server installer
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "rounded",
			},
		},
	},
	-- Mason-LSPConfig bridge
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		lazy = false,
		config = function()
			-- Set up capabilities for blink-cmp
			local capabilities = require("blink-cmp").get_lsp_capabilities()

			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"eslint",
					"lua_ls",
				},
				automatic_installation = false,
				handlers = {
					-- Default handler - applies to all servers without a custom handler
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,
					-- We can add any custom handlers for specific servers if needed here
				},
			})
		end,
	},
	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"ibhagwan/fzf-lua",
		},
		lazy = false,
		config = function()
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "»" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- Attach keymaps when LSP attaches to a buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "Configure LSP keymaps",
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end
					setup_lsp_keymaps(client, args.buf)
				end,
			})
		end,
	},
}
