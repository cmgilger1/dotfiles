return {{
    "folke/neodev.nvim",
    event = "VeryLazy",
    config = function()
        require("neodev").setup({
            library = {
                plugins = { "nvim-dap-ui" },
                types = true,
            },
        })
    end,
},
}
