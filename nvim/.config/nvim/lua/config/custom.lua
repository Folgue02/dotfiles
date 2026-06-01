-- Copy the absolute path of the current file to the system clipboard
vim.api.nvim_create_user_command('CopyPath', function()
    local path = vim.fn.expand('%:p')
    vim.fn.setreg('+', path)
    vim.fn.setreg('*', path)
    vim.notify('Copied: ' .. path)
end, { desc = 'Copy current file path to clipboard' })

-- Open the current file at the current line in Sublime Text
vim.api.nvim_create_user_command('Subl', function()
    local path = vim.fn.expand('%:p')
    local line = vim.fn.line('.')
    local target = path .. ':' .. line

    local is_win = vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1
    if is_win then
        vim.fn.jobstart({ 'cmd', '/c', 'subl', target }, { detach = true })
    else
        vim.fn.jobstart({ 'subl', target }, { detach = true })
    end
end, { desc = 'Open current file in Sublime Text' })
