return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                transparent_background = true,
            })
            vim.cmd.colorscheme("catppuccin-macchiato")
        end,
    },
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme('everforest')
        end
    },
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- require('onedark').setup {
            --     style = 'deep'
            -- }
            -- -- Enable theme
            -- require('onedark').load()
        end
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme('everforest')
        end
    },
    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
        --    vim.cmd.colorscheme("carbonfox")
            -- vim.cmd.colorscheme("nordfox")
            -- vim.cmd.colorscheme("nightfox")
            -- vim.cmd.colorscheme("dawnfox")
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            -- vim.cmd.colorscheme("tokyonight-night")
            -- vim.cmd.colorscheme("tokyonight-moon")
            -- vim.cmd.colorscheme("tokyonight-storm")
            -- vim.cmd.colorscheme("tokyonight-day")
        end

    },
    {
        "rose-pine/neovim",
        config = function()
            -- vim.cmd.colorscheme("rose-pine-main")
            -- vim.cmd.colorscheme("rose-pine-moon")
            -- vim.cmd.colorscheme("rose-pine-dawn")
        end
    },
}
