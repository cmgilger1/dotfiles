return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-neotest/nvim-nio",
            "nvim-neorg/lua-utils.nvim",
            "nvim-lua/plenary.nvim"
        },
    },
    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim", "luarocks.nvim", "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter" },
        after = 'nvim-treesitter',
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.autocommands"] = {},
                    ["core.highlights"] = {},
                    ["core.presenter"] = {
                        config = {
                            zen_mode = "zen-mode",
                        },
                    },
                    ["core.concealer"] = {
                        config = {
                            icons = {
                                code_block = {
                                    conceal = true,
                                    width = "content"
                                }
                            }
                        }

                    }, -- Adds pretty icons to your documents
                    ["core.integrations.treesitter"] = {},
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp"
                        }
                    },
                    ["core.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                        },
                    },
                },
            }
        end,
    },
}
