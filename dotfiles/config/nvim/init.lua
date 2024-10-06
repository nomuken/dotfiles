require('plugins.lazy')

vim.o.undofile = true

vim.opt.undofile = true
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'

vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.writebackup = false
vim.opt.number = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 1
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.showmatch = true
vim.opt.matchtime = 1

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

if vim.fn.exists('+termguicolors') == 1 then
    vim.opt.termguicolors = true
end

-- setting up the keymaps
vim.cmd('runtime!' .. 'keymap.vim')
