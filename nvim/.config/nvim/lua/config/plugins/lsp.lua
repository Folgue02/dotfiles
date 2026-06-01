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
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<A-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-e>"] = cmp.mapping.abort(),
				}),
				window = {
					completion = cmp.config.window.bordered({ border = "rounded" }),
					documentation = cmp.config.window.bordered({ border = "rounded" })
				},
				sources = cmp.config.sources({
					{ name = "lazydev", group_index = 0 },
					{ name = "nvim_lsp" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},

	-- NVIM config completion
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
