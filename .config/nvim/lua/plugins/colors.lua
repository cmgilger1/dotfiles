return {
    { 
        "catppuccin/nvim", 
        lazy = false,
        name = "catppuccin", 
        priority = 1000,
        config = function()
            -- require("themes.catppuccin")
        end,
    },
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            -- require("themes.everforest")
        end
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            -- require("themes.nordic")
        end
    },
    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require("themes.nightfox")
        end
    },
}
