return {
    {
        "williamboman/mason.nvim",
        config = true,
        config = function()
            require('mason').setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
        build = ":MasonUpdate",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "dockerls",
                "jsonls",
                "lua_ls",
                "yamlls",
            },
        },
        dependencies = {
            "williamboman/mason.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function(_, opts_lazy)
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup(opts_lazy)

            mason_lspconfig.setup_handlers({
                function(server_name)
                    if server_name == "sonarlint-language-server" then
                        require('lspconfig')[server_name].setup({
                            server = {
                                cmd = {
                                    'sonarlint-language-server',
                                    -- Ensure that sonarlint-language-server uses stdio channel
                                    '-stdio',
                                    '-analyzers',
                                    vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
                                    vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
                                }
                            },
                            settings = {
                                sonarlint = {
                                    pathToCompileCommands =  vim.fn.getcwd() .. '/compile_commands.json'
                                }
                            },
                            filetypes = {
                                'cpp',
                                'c'
                            }
                        })
                    else
                        -- require('lspconfig')[server].setup()
                    end
                end,
            })
        end,
    },

}
