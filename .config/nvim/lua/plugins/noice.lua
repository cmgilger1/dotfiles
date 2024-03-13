return {
    {
        "folke/noice.nvim",
        event = "VimEnter",
        config = function()
            local ok, _ = pcall(require, "notify")
            require("noice").setup({
                messages = {
                    view = "notify", -- mini
                    view_search = "virtualtext",
                },
                routes = {
                    {
                        view = ok and "notify" or "mini",
                        filter = {
                            event = "msg_show",
                            find = "substitutions",
                        },
                    },
                    { filter = { find = "fewer lines;" }, opts = { skip = true } },
                    { filter = { find = "more line;" }, opts = { skip = true } },
                    { filter = { find = "more lines;" }, opts = { skip = true } },
                    { filter = { find = "less;" }, opts = { skip = true } },
                    { filter = { find = "change;" }, opts = { skip = true } },
                    { filter = { find = "changes;" }, opts = { skip = true } },
                    { filter = { find = "indent" }, opts = { skip = true } },
                    { filter = { find = "move" }, opts = { skip = true } },
                },
                cmdline = { 
                    enabled = true,
                    view = "cmdline_popup" 
                },
                views = {
                    popupmenu = {
                        size = { width = 50, height = 10 },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                        win_options = {
                            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                        },
                    },
                },
                lsp = {
                    message = {
                        enabled = false,
                    },
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presets = {
                    -- bottom_search = true,
                    command_palette =  true,
                    long_message_to_split = true,
                    lsp_doc_border = true,
                },
            })
        end,
        dependencies = { 
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end 
    }
}

