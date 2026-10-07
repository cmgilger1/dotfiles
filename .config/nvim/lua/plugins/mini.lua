vim.pack.add({"https://github.com/nvim-mini/mini.align"})
vim.pack.add({"https://github.com/nvim-mini/mini.surround"})
vim.pack.add({"https://github.com/nvim-mini/mini.completion"})
vim.pack.add({"https://github.com/nvim-mini/mini.snippets"})
vim.pack.add({"https://github.com/nvim-mini/mini.comment"})
vim.pack.add({"https://github.com/nvim-mini/mini.pick"})
vim.pack.add({"https://github.com/nvim-mini/mini.icons"})

require("mini.pick").setup()
require("mini.align").setup()
require("mini.icons").setup()
require("mini.comment").setup()
require("mini.surround").setup()
require("mini.snippets").setup()
require("mini.completion").setup()

local pick = require('mini.pick')

vim.keymap.set(
    "n",
    "<leader><leader>",
    function() pick.builtin.files() end,
    { desc = "Fyler.nvim - Open" }
)

vim.keymap.set(
    "n",
    "<leader>/",
    function() pick.builtin.grep_live() end,
    { desc = "Fyler.nvim - Open" }
)

vim.keymap.set(
    "n",
    "<leader>sw",
    function() pick.builtin.grep({ pattern = vim.fn.expand('<cword>')}) end,
    { desc = "Fyler.nvim - Open" }
)

