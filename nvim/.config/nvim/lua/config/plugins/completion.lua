return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local cmp = require("cmp")
			local lsp_disabled = vim.env.NVIM_LSP_DISABLED ~= nil

			local lsp_sources = {
				{ name = "lazydev", group_index = 0 },
				{ name = "nvim_lsp" },
			}
			local fallback_sources = {
				{ name = "buffer" },
				{ name = "path" },
			}

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<A-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-e>"] = cmp.mapping.abort(),
				}),
				window = {
					completion = cmp.config.window.bordered({ border = "rounded" }),
					documentation = cmp.config.window.bordered({ border = "rounded" }),
				},
				sources = lsp_disabled
					and cmp.config.sources(fallback_sources)
					or cmp.config.sources(lsp_sources, fallback_sources),
			})
		end,
	},

	-- NVIM config completion (only useful alongside LSP)
	{
		"folke/lazydev.nvim",
		ft = "lua",
		cond = function()
			return vim.env.NVIM_LSP_DISABLED == nil
		end,
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
