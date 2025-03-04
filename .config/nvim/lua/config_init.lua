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

require("core.options")
require("core.keybindings")
require("core.plugins")
require("core.utils.utils")
require("core.autocommands")
if vim.g.neovide then
    require("core.neovide")
end

vim.api.nvim_create_user_command("UpdateMyConfig", function()
  require("core.utils.utils").updateAll()
end, { desc = "Updates plugins, mason packages, treesitter parsers" })

tmpfile=vim.fn.tempname()
vim.fn.serverstart(tmpfile)
vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.titlestring = "nvim: %t [" .. tmpfile .. "]"

