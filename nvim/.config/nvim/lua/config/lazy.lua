-- Other configs
require('config.lsp')

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- Plugins related to appearance
		{ import = 'config.plugins.visual' },

		-- Miscellaneous plugins
		{ import = 'config.plugins.misc' },

		-- Utility plugins (i.e. telescope)
		{ import = 'config.plugins.utilities' },

		-- LSP related plugins (i.e. mason)
		{ import = 'config.plugins.lsp' },
	},
	install = { colorscheme = { "kanagawa" } },
})
