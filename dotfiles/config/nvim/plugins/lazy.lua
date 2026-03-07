local lazy_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local config_path = vim.fn.stdpath('config')
package.path = package.path
    .. ';'
    .. config_path
    .. '/?.lua;'
    .. config_path
    .. '/?/init.lua'
if not vim.uv.fs_stat(lazy_path) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazy_path,
    })
end

vim.opt.rtp:prepend(lazy_path)

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('lazy').setup({ spec = { import = "plugins.packages" } })
