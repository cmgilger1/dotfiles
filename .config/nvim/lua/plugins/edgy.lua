return {
    {
        "folke/edgy.nvim",
        event = "VeryLazy",
        opts = {
            bottom = {
                {
                    ft = "snacks_terminal",
                    size = { height = 0.2 },
                    title = "terminal"
                },
                { ft = "qf", title = "quickfix" },
                {
                    title = "overseer",
                    ft = "overseer",
                    -- pinned = true,
                    -- collapsed = true, -- show window as closed/collapsed on start
                    open = "OverseerOpen",
                },
            }
        }
    }
}
