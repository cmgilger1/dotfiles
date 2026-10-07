require("core.options")
require("core.keybindings")
require("core.lsp")
require("core.utils.utils")
require("core.autocommands")

tmpfile=vim.fn.tempname()
vim.fn.serverstart(tmpfile)
vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.titlestring = "nvim: %t [" .. tmpfile .. "]"

require("plugins.barbecue")
require("plugins.colors")
require("plugins.gitsigns")
require("plugins.rust")
require("plugins.noice")
require("plugins.lualine")
require("plugins.mini")
require("plugins.mason")
require("plugins.fyler")
require("plugins.rust")

