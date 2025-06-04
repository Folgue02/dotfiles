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

-- ---------------------
-- Appearance
-- ---------------------
vim.opt.relativenumber = true

-- Transparent background
lvim.transparent_window = true

-- No curr line highlighting
vim.opt.cursorline = false

-- Cursor
vim.opt.guicursor = "i:block"


-- ---------------------
-- Disable keybinds
-- ---------------------
lvim.keys.insert_mode["<A-j>"] = false
lvim.keys.insert_mode["<A-k>"] = false
lvim.keys.normal_mode["<A-j>"] = false
lvim.keys.normal_mode["<A-k>"] = false
lvim.keys.visual_block_mode["<A-j>"] = false
lvim.keys.visual_block_mode["<A-k>"] = false
lvim.keys.visual_block_mode["J"] = false
lvim.keys.visual_block_mode["K"] = false
