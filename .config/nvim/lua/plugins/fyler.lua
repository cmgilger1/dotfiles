vim.pack.add({"https://github.com/FylerOrg/fyler.nvim"})

require('fyler').setup()

local fyler = require('fyler')

vim.keymap.set(
    "n",
    "<leader>e",
    function() fyler.open({ kind = "floating", ui = { indent_guides = true}} ) end,
    { desc = "Fyler.nvim - Open" }
)
