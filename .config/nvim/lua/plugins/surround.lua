return {
    {
        "kylechui/nvim-surround",
        event = "VimEnter",
        config = function()
            require("nvim-surround").setup()
        end,
    },
}
