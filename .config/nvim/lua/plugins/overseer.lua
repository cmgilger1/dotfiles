return {
    {
        'stevearc/overseer.nvim',
        event = "VimEnter",
        config = function()
            require('overseer').setup({
                templates = { "builtin", "mytasks.dmake" }
            })
        end
    },
}
