local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- set leader to ;
vim.g.mapleader=';'
vim.g.maplocalleader=';'

require('lazy').setup('plugins')

require('modules.myfugitive')
require('modules.mytelescope')
require('modules.mycatppuccin')
require('modules.mylspconfig')
require('modules.mygitsigns')
require('modules.mynvimtree')
require('modules.cmakelualine')
require('modules.mycmaketools')
require('modules.mytreesitter')
require('modules.mytabby')
require('modules.mycmp')
require('modules.mymini')
require('custom.keymaps')
require('custom.options')
