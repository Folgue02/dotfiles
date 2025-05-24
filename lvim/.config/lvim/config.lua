lvim.plugins = {
  { 'wakatime/vim-wakatime', lazy = false },
  { 'blazkowolf/gruber-darker.nvim' }
}

lvim.colorscheme = 'gruber-darker'

-- Disable buffer suggestions
lvim.builtin.cmp.sources = {
  { name = 'nvim_lsp' },
  { name = 'path' },
  --{ name = 'luasnip' },
  --{ name = 'buffer' }
}

-- Options
vim.opt.relativenumber = true
