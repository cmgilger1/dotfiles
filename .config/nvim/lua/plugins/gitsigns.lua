return {
    "lewis6991/gitsigns.nvim",
    event = "VimEnter",
    config = function()
        require("gitsigns").setup({
            on_attach = function()
                local gs = package.loaded.gitsigns
                local map = require('core.utils.utils').map
                -- travel between hunks, backwards and forwards
                map("n", "]c", function()
                    if vim.wo.diff then
                        return "]c"
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "go to previous git hunk" })
                map("n", "[c", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "go to next git hunk" })

                map("n", "<leader>hs", gs.stage_hunk, { desc = "stage hunk" })
                map("n", "<leader>hr", gs.reset_hunk, { desc = "reset hunk" })
                map("n", "<leader>hS", gs.stage_buffer, { desc = "stage buffer" })
                map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
                map("n", "<leader>hR", gs.reset_buffer, { desc = "reset buffer" })
                map("n", "<leader>hp", gs.preview_hunk, { desc = "preview hunk" })
                map("n", "<leader>hb", function()
                    gs.blame_line({ full = true })
                end, { desc = "complete blame line history" })
                map("n", "<leader>lb", gs.toggle_current_line_blame, { desc = "toggle blame line" })
                -- diff at current working directory
                map("n", "<leader>hd", gs.diffthis, { desc = "diff at cwd" })
                -- diff at root of git repository
                map("n", "<leader>hD", function()
                    gs.diffthis("~")
                end, { desc = "diff at root of git repo" })
                map("n", "<leader>td", gs.toggle_deleted, { desc = "toggle deleted line" })
            end
        })
    end,
}
