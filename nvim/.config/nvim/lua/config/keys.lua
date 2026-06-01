vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "K",  vim.lsp.buf.hover,          opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition,     opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.rename,         opts)
		vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float, opts)
	end,
})

-- Clipboard

-- Paste from system clipboard in Normal mode
vim.keymap.set('n', '<D-v>', '"+p', { noremap = true })

-- Paste from system clipboard in Insert Mode
vim.keymap.set('i', '<D-v>', '<C-r>+', { noremap = true })

-- Oil
vim.keymap.set('n', '<leader>e', ':Oil<CR>')
