return {
	"Saghen/blink.cmp",
	version = "*",
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
	},
	opts = {
		completion = {
			accept = { auto_brackets = { enabled = true } },
			list = {
				selection = { preselect = true },
			},
		},
		snippets = { preset = "luasnip" },
		signature = { enabled = true },
		fuzzy = { implementation = "prefer_rust" },
		sources = {
			default = { "lsp", "snippets", "path", "buffer" },
		},

		keymap = {
			preset = "default",
			["<Tab>"] = { "accept", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "snippet_forward", "select_next", "fallback" },
			["<C-p>"] = { "snippet_backward", "select_prev", "fallback" },
		},
	},
}
