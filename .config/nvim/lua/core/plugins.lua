require("lazy").setup({
    {
        "stevearc/aerial.nvim",
        cmd = "AerialToggle",
        config = function()
            require("plugin-configs.aerial")
        end,
    },
    {
        "goolord/alpha-nvim",
        lazy = false,
        config = function()
            require("alpha").setup(require("plugin-configs.alpha").config)
        end,
    },
    {
        "okuuva/auto-save.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin-configs.auto-save")
        end,
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        event = "VimEnter",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            require("barbecue").setup()
        end,
    },
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin-configs.dressing")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VimEnter",
        config = function()
            require("plugin-configs.gitsigns")
        end,
    },
    {
        "phaazon/hop.nvim",
        event = "VimEnter",
        branch = "v2",
        config = function()
            require("plugin-configs.hop")
        end,
    },
    {
        'tpope/vim-fugitive',
        event = "VimEnter"
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VimEnter",
        config = function()
            require("ibl").setup({ scope = { enabled = false } })
        end,
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        event = "VimEnter",
        branch = "v2.x",
        config = function()
            require("plugin-configs.lsp")
        end,
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
        },
    },
    {
        "folke/neodev.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin-configs.neodev")
        end,
    },
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin-configs.neoscroll")
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin-configs.neo-tree")
        end,
        branch = "v3.x",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "folke/noice.nvim",
        event = "VimEnter",
        config = function()
            require("plugin-configs.noice")
        end,
        dependencies = { { "MunifTanjim/nui.nvim" } },
    },
    {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugin-configs.null-ls")
        end,
        dependencies = {
            {
                "jay-babu/mason-null-ls.nvim",
                cmd = { "NullLsInstall", "NullLsUninstall" },
                config = function()
                    require("plugin-configs.mason-null-ls")
                end,
            },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("plugin-configs.cmp")
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
        "NvChad/nvim-colorizer.lua", 
        event = "VimEnter" 
    },
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        config = function()
            require("plugin-configs.dap")
        end,
        dependencies = {
            {
                "jay-babu/mason-nvim-dap.nvim",
                cmd = { "DapInstall", "DapUninstall" },
                config = function()
                    require("plugin-configs.mason-nvim-dap")
                end,
            },
            {
                "rcarriga/nvim-dap-ui",
                config = function()
                    require("dapui").setup()
                end,
            },
            {
                "theHamsta/nvim-dap-virtual-text",
                config = function()
                    require("nvim-dap-virtual-text").setup()
                end,
            },
        },
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end 
    },
    {
        "kylechui/nvim-surround",
        event = "VimEnter",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("plugin-configs.treesitter")
        end,
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects" },
            { "windwp/nvim-ts-autotag" },
            { "JoosepAlviste/nvim-ts-context-commentstring" },
        },
    },
    { 
        "catppuccin/nvim", 
        lazy = false,
        name = "catppuccin", 
        priority = 1000,
        config = function()
            -- require("themes.catppuccin")
        end,
    },
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            -- require("themes.everforest")
        end
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            -- require("themes.nordic")
        end
    },
    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require("themes.nightfox")
        end
    },
    {
        'airblade/vim-rooter',
        event = "VimEnter",
        config = function()
            require('plugin-configs.rooter')
        end
    },
    {
        'stevearc/overseer.nvim',
        opts = {},
        event = "VimEnter",
        config = function()
            require('overseer').setup()
        end
    },
    { 
        'Civitasv/cmake-tools.nvim',
        event = "VimEnter",
        config = function()
            require("plugin-configs.cmaketools")
        end,
    },
    { "nvim-lua/plenary.nvim" },
    {
        "ahmedkhalf/project.nvim",
        event = "VimEnter",
        config = function()
            require("project_nvim").setup()
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
                dependencies = {
                    'junegunn/fzf.vim'
                },
                config = function()
                    require('telescope').load_extension('fzf')
                end,

            },
        },
        config = function()
            require("plugin-configs.telescope")
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        event = "VeryLazy",
        config = function()
            _G.term = require("plugin-configs.toggleterm")
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
    },
    {
        "folke/twilight.nvim",
        lazy = false,
        cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
        config = function()
            require("plugin-configs.twilight")
        end,
    },
    {
        "nvim-neorg/neorg",
        lazy = false,
        build = ":Neorg sync-parsers",
        -- tag = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
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
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup()
        end,
    },
    {
        "windwp/windline.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin-configs.windline")
        end,
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
		config = function()
			require("plugin-configs.zen")
		end,
    },
}, {
    defaults = { lazy = true },
    performance = {
        rtp = {
            disabled_plugins = { "tohtml", "gzip", "zipPlugin", "netrwPlugin", "tarPlugin" },
        },
    },
})
