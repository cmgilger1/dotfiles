-- options
vim.opt.listchars = { space = '.', tab = '>>', eol = '↵' }
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.smarttab = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 8
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

-- https://vi.stackexchange.com/questions/1983/how-can-i-get-vim-to-stop-putting-comments-in-front-of-new-lines/1985#1985 
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = '*',
  callback = function ()
    vim.opt.formatoptions:remove({ 'o', 'r' })
  end
})

