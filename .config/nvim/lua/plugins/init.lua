return {
    -- helper plugins
    'tpope/vim-sensible',
    'nvim-lua/plenary.nvim',
    'rcarriga/nvim-notify',
    'nvim-tree/nvim-web-devicons',

    -- fuzzy finder plugins
    'nvim-telescope/telescope.nvim',
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    { 'junegunn/fzf', build = "./install --all" },

    -- file tree plugins
    'nvim-tree/nvim-tree.lua', -- file tree
    'nanozuki/tabby.nvim', -- nice looking tabs

    -- colors plugins
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- code editor plugins
    { 'echasnovski/mini.nvim', version = '*' },
    -- 'tpope/vim-commentary',
    'nvim-lualine/lualine.nvim',
    'tpope/vim-abolish', -- better substitution (keep case), coercion (myVar -> MyVar -> my_var)
    'nvim-treesitter/nvim-treesitter',

    -- auto completion plugins
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',

    -- lsp zero config
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'L3MON4D3/LuaSnip',

    -- git plugins
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    'cedarbaum/fugitive-azure-devops.vim',

    -- cmake / build tools plugins
    'Civitasv/cmake-tools.nvim',
}
