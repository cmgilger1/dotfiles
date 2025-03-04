return {
    {
        "folke/edgy.nvim",
        event = "VeryLazy",
        opts = {
            bottom = {
                {
                    ft = "snacks_terminal",
                    size = { height = 0.2 },
                    title = "%{b:term_title}",
                    filter = function(_buf, win)
                        return vim.w[win].snacks_win
                        and vim.w[win].snacks_win.position == pos
                        and vim.w[win].snacks_win.relative == "editor"
                        and not vim.w[win].trouble_preview
                    end,
                },
                "Trouble",
                { ft = "qf", title = "QuickFix" },
                {
                    title = "Overseer",
                    ft = "overseer",
                    -- pinned = true,
                    -- collapsed = true, -- show window as closed/collapsed on start
                    open = "OverseerOpen",
                },
            }
        }
    }
}
