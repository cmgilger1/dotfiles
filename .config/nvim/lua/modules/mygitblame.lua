vim.keymap.set('n', '<leader>bl', '<cmd>ToggleBlame window<cr>', {silent = true})

require('blame').setup({
    width = 50,
    date_format = "<%m/%d/%Y>",
    merge_consecutive = true,
    virtual_style = "float"
})
