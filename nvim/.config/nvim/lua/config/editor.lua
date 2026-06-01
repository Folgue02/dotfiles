-- Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Gutter
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'

-- Cursor
vim.opt.guicursor = "i-ci-ve:block"

-- Rounded documentation popups
vim.o.winborder = 'rounded'

-- Backup files
local baks_dir = vim.fn.expand('~/.nvimbaks')
vim.fn.mkdir(baks_dir, 'p')
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = baks_dir
vim.o.backupdir = baks_dir


-- Gui settings
--vim.cmd('set guifont=Menlo:h17')
--vim.cmd('set guifont=Hurmit\\ Nerd\\ Font\\ Mono:h20')
vim.cmd('set guifont=ComicShannsMono\\ Nerd\\ Font\\ Mono:h20')
