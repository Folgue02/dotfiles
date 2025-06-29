lvim.plugins = {
  { 'wakatime/vim-wakatime', lazy = false },
  { 'blazkowolf/gruber-darker.nvim' },
  { 'bluz71/vim-moonfly-colors', name = 'moonfly', lazy = false, priority = 1000 },
  { 'mfussenegger/nvim-jdtls', lazy = true }
}

lvim.colorscheme = 'moonfly'

-- Disable buffer suggestions
lvim.builtin.cmp.sources = {
  { name = 'nvim_lsp' },
  { name = 'path' },
  --{ name = 'luasnip' },
  --{ name = 'buffer' },
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

-- ------------------------
-- Disable TS' crash logs
-- ------------------------
local orig_notify = vim.notify

vim.notify = function(msg, level, opts)
  -- Suppress Tree-sitter crash logs
  if msg:match(".*parser.*Tree%-sitter.*") or msg:match("Tree%-sitter error") then
    return
  end
  return orig_notify(msg, level, opts)
end

-- ------------------------
-- Java related configuration
-- ------------------------
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { 'jdtls' })

lvim.builtin.treesitter.ensure_installed = {
  'java'
}

local client = vim.lsp.get_client_by_id(0)
if client and client._request_name_to_capability then
end
