return {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
        require("neoscroll").setup({
            respect_scrolloff = true,
        })
        -- Neoscroll
        local t = {}
        -- Syntax: t[keys] = {function, {function arguments}}
        t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '200', [['sine']] } }
        t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '200', [['sine']] } }
        -- Use the "circular" easing function
        t['K'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '200', [['circular']] } }
        t['J'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '200', [['circular']] } }
        t['zt']    = {'zt', {'200'}}
        t['zz']    = {'zz', {'200'}}
        t['zb']    = {'zb', {'200'}}
        require('neoscroll.config').set_mappings(t)

    end,
}
