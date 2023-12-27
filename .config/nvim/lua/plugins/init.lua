return {
    -- helper plugins
    'tpope/vim-sensible',
    'nvim-lua/plenary.nvim',
    'rcarriga/nvim-notify',
    'nvim-tree/nvim-web-devicons',

    -- fuzzy finder plugins
    'nvim-telescope/telescope.nvim',
    { 'junegunn/fzf', build = "./install --all" },

    -- file tree plugins
    'nvim-tree/nvim-tree.lua',
    'nanozuki/tabby.nvim',

    -- colors plugins
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- code editor plugins
    'tpope/vim-commentary',
    'nvim-lualine/lualine.nvim',
    'christoomey/vim-tmux-navigator',
    'nvim-treesitter/nvim-treesitter',
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- auto completion plugins
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',

    -- lsp zero config
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    'neovim/nvim-lspconfig',
    'L3MON4D3/LuaSnip',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',

    -- git plugins
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    'FabijanZulj/blame.nvim',

    -- cmake / build tools plugins
    'Civitasv/cmake-tools.nvim',
}
