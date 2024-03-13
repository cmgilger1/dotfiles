return {
    {
        "folke/twilight.nvim",
        lazy = false,
        cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
        config = function()
            require("twilight").setup({
                dimming = {
                    inactive = true,
                },
                context = 15,
            })
        end,
    },
}
