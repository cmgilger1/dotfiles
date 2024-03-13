return {
    "lewis6991/gitsigns.nvim",
    event = "VimEnter",
    config = function()
        require("gitsigns").setup({
            on_attach = require("core.keybindings").gitsigns(),
        })
    end,
}
