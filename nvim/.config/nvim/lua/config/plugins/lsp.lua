return {
	{
		'neovim/nvim-lspconfig',
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- Apply capabilities to all servers globally
			vim.lsp.config('*', { capabilities = capabilities })

			-- Blade: extend emmet to cover blade filetypes
			vim.lsp.config('emmet_ls', {
				filetypes = { 'html', 'css', 'blade', 'php' },
			})
		end
	},
	{
		"mason-org/mason.nvim",
		opts = {}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				'lua_ls',
				'intelephense',
				'pyright',
				'ts_ls',   -- covers JS, TS, JSX, TSX
				'html',
				'cssls',
				'bashls',
				'sqlls',
				'emmet_ls', -- blade template completions (HTML-in-PHP)
			},
			automatic_enable = true,
		},
	},
}
