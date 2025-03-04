return {
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require('lspconfig').clangd.setup {}
            require('lspconfig').lua_ls.setup {}
            require('lspconfig').pyright.setup {}
            require('lspconfig').cmake.setup {}
            -- require('sonarlint').setup({
            --     server = {
            --         cmd = {
            --             'sonarlint-language-server',
            --             -- Ensure that sonarlint-language-server uses stdio channel
            --             '-stdio',
            --             '-analyzers',
            --             -- paths to the analyzers you need, using those for python and java in this example
            --             vim.fn.expand("/home/caroline/.local/nvim/mason/share/sonarlint-analyzers/sonarpython.jar"),
            --             vim.fn.expand("/home/caroline/.local/nvim/mason/share/sonarlint-analyzers/sonarcfamily.jar"),
            --             vim.fn.expand("/home/caroline/.local/nvim/mason/share/sonarlint-analyzers/sonarjava.jar"),
            --         }
            --     },
            --     filetypes = {
            --         -- Tested and working
            --         'python',
            --         'c++',
            --         'c'
            --     }
            -- })

            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = false,
                update_in_insert = false,
                severity_sort = false,
            })
            local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end,
        dependencies = {
            -- { "williamboman/mason.nvim" },
            -- { "williamboman/mason-lspconfig.nvim" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "p00f/clangd_extensions.nvim" },
            { "https://gitlab.com/schrieveslaach/sonarlint.nvim" },
        }
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                sorting = {
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.recently_used,
                        require("clangd_extensions.cmp_scores"),
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
                enabled = function()
                    -- disables in comments
                    local context = require("cmp.config.context")
                    if vim.api.nvim_get_mode().mode == "c" then
                        buftype = vim.api.nvim_buf_get_option(0, "buftype")
                        if buftype == "prompt" then return false end
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
                        symbol_map = { Codeium = "" },
                    }),
                },
                performance = {
                    max_view_entries = 7
                },
                mapping = {
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        local col = vim.fn.col('.') - 1
                        if cmp.visible() then
                            cmp.select_next_item({ select = false})
                        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                            fallback()
                        else
                            cmp.complete()
                        end
                    end),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item({ select = false })
                        else
                            fallback()
                        end
                    end),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<M-k>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
                    ['<M-j>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
                    ['<C-p>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = 'insert' })
                        else
                            cmp.complete()
                        end
                    end),
                    ['<C-n>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = 'insert' })
                        else
                            cmp.complete()
                        end
                    end),
                },
                sources = {
                    { name = "codeium" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "luasnip" },
                    { name = "path",    option = { trailing_slash = true } },
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
    {
        "p00f/clangd_extensions.nvim",
        lazy = true,
        config = function() end,
        opts = {
            inlay_hints = {
                inline = false,
            },
            ast = {
                --These require codicons (https://github.com/microsoft/vscode-codicons)
                role_icons = {
                    type = "",
                    declaration = "",
                    expression = "",
                    specifier = "",
                    statement = "",
                    ["template argument"] = "",
                },
                kind_icons = {
                    Compound = "",
                    Recovery = "",
                    TranslationUnit = "",
                    PackExpansion = "",
                    TemplateTypeParm = "",
                    TemplateTemplateParm = "",
                    TemplateParamObject = "",
                },
            },
        },
    }
}
