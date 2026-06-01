-- Other configs
local lsp_disabled = vim.env.NVIM_LSP_DISABLED ~= nil

if not lsp_disabled then
	require('config.lsp')
end

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- Plugins related to appearance
		{ import = 'config.plugins.visual' },

		-- Miscellaneous plugins
		{ import = 'config.plugins.misc' },

		-- Utility plugins (i.e. telescope)
		{ import = 'config.plugins.utilities' },

		-- LSP related plugins (i.e. mason) — skipped when NVIM_LSP_DISABLED is set
		not lsp_disabled and { import = 'config.plugins.lsp' } or nil,
	},
	install = { colorscheme = { "kanagawa" } },
})
