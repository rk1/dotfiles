return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"honza/vim-snippets",
		},
		config = function()
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_snipmate").lazy_load()

			luasnip.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
			})
		end,
	},
}
