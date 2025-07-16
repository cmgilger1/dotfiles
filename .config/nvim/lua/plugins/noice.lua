return {
    {
        "folke/noice.nvim",
        event = "VimEnter",
        config = function()
            local ok, _ = pcall(require, "notify")
            require("noice").setup({
                presets = {
                    command_palette =  true,
                },
            })
        end,
        dependencies = { 
            "MunifTanjim/nui.nvim",
        }
    },
}

