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

require("core.utils.utils")
require("core.options")
require("core.keybindings")
require("core.autocommands")
require("core.plugins")

vim.api.nvim_create_user_command("UpdateMyConfig", function()
  require("core.utils.utils").updateAll()
end, { desc = "Updates plugins, mason packages, treesitter parsers" })
