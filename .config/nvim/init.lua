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

-- needed for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- options
vim.opt.listchars = { space = '.', tab = '>>', eol = '↵' }
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.smarttab = false
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true 
vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
        ['+'] = 'win32yank.exe -i --crlf',
        ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
        ['+'] = 'win32yank.exe -o --lf',
        ['*'] = 'win32yank.exe -o --lf',
    }
}
vim.opt.clipboard = 'unnamedplus'
--vim.opt.list = true

-- some generic mappings
vim.keymap.set('n', '>', ';', {}) -- remap ; (leader) to >
vim.keymap.set('n', '<', ',', {}) -- because this makes sense
vim.keymap.set('n', '<leader>nh', '<cmd>nohl<cr>', {}) -- toggle nohl
vim.keymap.set('n', '<leader>j', 'J', {}) -- first map <leader>j to join()
vim.keymap.set('n', 'J', '<C-f>zz', {})   -- then map J & K to scroll
vim.keymap.set('n', 'K', '<C-b>zz', {})
vim.keymap.set('n', 'L', '<cmd>tabn<cr>', {})
vim.keymap.set('n', 'H', '<cmd>tabp<cr>', {})
vim.keymap.set('n', '<leader>1', '1gt', {})
vim.keymap.set('n', '<leader>2', '2gt', {})
vim.keymap.set('n', '<leader>3', '3gt', {})
vim.keymap.set('n', '<leader>4', '4gt', {})
vim.keymap.set('n', '<leader>5', '5gt', {})
vim.keymap.set('n', '<leader>6', '6gt', {})
vim.keymap.set('n', '<leader>7', '7gt', {})
vim.keymap.set('n', '<leader>8', '8gt', {})
vim.keymap.set('n', '<leader>9', '9gt', {})
vim.keymap.set("n", "<leader>ws", "<cmd>set list!<CR>", {silent = true}) -- toggle whitespace

vim.keymap.set({ "n", "v" }, "<leader>v", [["+p]], { desc = "paste AFTER from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>V", [["+P]], { desc = "paste BEFORE from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>c", [["+y]], { desc = "yank AFTER from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>c", [["+Y]], { desc = "yank BEFORE from clipboard" })

vim.keymap.set('i', '<M-h>', '<Left>', {});
vim.keymap.set('i', '<M-l>', '<Right>', {});
vim.keymap.set('i', '<M-k>', '<Up>', {});
vim.keymap.set('i', '<M-j>', '<Down>', {});

vim.keymap.set({'n', 'i', 'v'}, '<C-h>', '<C-w>h', {})
vim.keymap.set({'n', 'i', 'v'}, '<C-l>', '<C-w>l', {})
vim.keymap.set({'n', 'i', 'v'}, '<C-k>', '<C-w>k', {})
vim.keymap.set({'n', 'i', 'v'}, '<C-j>', '<C-w>j', {})


function toggle_quickfix()
 local windows = vim.fn.getwininfo()
 for _, win in pairs(windows) do
   if win["quickfix"] == 1 then
     vim.cmd.cclose()
     return
   end
 end
 vim.cmd.copen()
end
vim.keymap.set({'n'}, '<leader>qf', toggle_quickfix, {})

require('modules.mytelescope')
require('modules.mycatppuccin')
require('modules.mylspconfig')
require('modules.mygitsigns')
require('modules.mynvimtree')
require('modules.cmakelualine')
require('modules.mycmaketools')
require('modules.mygitblame')
require('modules.mytreesitter')
require('modules.mytabby')
require('modules.mycmp')
