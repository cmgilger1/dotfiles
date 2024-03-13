return {
    "phaazon/hop.nvim",
    event = "VimEnter",
    branch = "v2",
    config = function()
        require("hop").setup({
            multi_windows = true,
        })
    end,
}


