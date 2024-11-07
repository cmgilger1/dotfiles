return {
    {
        "Exafunction/codeium.nvim",
        event = 'BufEnter',
        config = function()
            require("codeium").setup({ 
                enable_chat = true
            })
            -- vim.keymap.set('i', '<Left>', vim.fn['codeium#Accept'](), { expr = true, silent = true })
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
    },
    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({})
    --     end,
    -- },
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     config = function ()
    --         require("copilot_cmp").setup()
    --     end
    -- },
}
