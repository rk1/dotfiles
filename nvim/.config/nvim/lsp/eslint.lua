---@type vim.lsp.Config
return {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_markers = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", "eslint.config.js" },
}
