return {
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        event = "VimEnter",
        branch = "v2.x",
        config = function()
            local lsp = require("lsp-zero")
            local lspconfig = require('lspconfig')
            lsp.preset("minimal")

            lsp.set_sign_icons({
                error = "✘",
                warn = "▲",
                hint = "⚑",
                info = "»",
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            }

            lspconfig.lua_ls.setup ({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })

            lspconfig.clangd.setup{
                capabilities = capabilities,
                cmd = { 'clangd',
                '--background-index',
                '-j=16',
                '--completion-style=detailed',
                '--header-insertion=iwyu',
                '--clang-tidy',
                '--enable-config',
                '--query-driver=/home/caroline/qnx710/host/linux/x86_64/usr/bin/*g++,/home/caroline/qnx710/host/linux/x86_64/usr/bin/*gcc'},
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    clangdFileStatus = true,
                    semanticHighlighting = true
                },
                on_attach = on_attach,
                flags = { debounce_text_changes = 150 },
                on_new_config = function(new_config, new_cwd)
                    local status, cmake = pcall(require, "cmake-tools")
                    if status then
                        cmake.clangd_on_new_config(new_config)
                    end
                end,
            }

            vim.lsp.handlers["textDocument/publishDiagnostics"] =
            vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics,
            {
                virtual_text = false,
                signs = true,
                underline = false
            }
            )

            lsp.setup()
        end,
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim"},
            { "williamboman/mason-lspconfig.nvim" },
        }
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            local cmp = require("cmp")
            local cmp_action = require("lsp-zero").cmp_action()
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
            local has_words_before = require("core.utils.utils").has_words_before
            cmp.setup({
                enabled = function()
                    -- disables in comments
                    local context = require("cmp.config.context")
                    if vim.api.nvim_get_mode().mode == "c" then
                        return true
                    else
                        return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
                    end
                end,
                preselect = "none",
                completion = {
                    keyword_length = 1,
                    completeopt = "menu,menuone,noinsert,noselect",
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    fields = { "abbr", "kind", "menu" },
                    format = require("lspkind").cmp_format({
                        maxwidth = 50,
                        ellipsis_char = "...",
                        mode = "symbol_text",
                        symbol_map = { Copilot = "" },
                    }),
                },
                performance = {
                    max_view_entries = 7
                },
                mapping = {
                    ['<Tab>'] = cmp_action.tab_complete(),
                    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
                    ['<CR>'] = cmp.mapping.confirm({select = false}),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<M-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
                    ['<M-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),
                    ['<C-p>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item({behavior = 'insert'})
                        else
                            cmp.complete()
                        end
                    end),
                    ['<C-n>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item({behavior = 'insert'})
                        else
                            cmp.complete()
                        end
                    end),
                },
                sources = {
                    { name = "copilot" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "luasnip" },
                    { name = "path", option = { trailing_slash = true } },
                },
            })
        end,
        dependencies = {
            { "onsails/lspkind.nvim" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    },
}

