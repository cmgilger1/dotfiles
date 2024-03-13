return {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
        require("dressing").setup({
            input = {
                title_pos = "center",
                insert_only = false,
            },
            mappings = false,
        })
    end,
}

