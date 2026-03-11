return {
    {
        'Civitasv/cmake-tools.nvim',
        event = "VimEnter",
        keys = {
            { '<leader>cp', '<cmd>CMakeSelectConfigurePreset<cr>' },
            { '<leader>bp', '<cmd>CMakeSelectBuildPreset<cr>' },
            { '<leader>bc', '<cmd>CMakeSelectBuildType<cr>' },
            { '<leader>bt', '<cmd>CMakeSelectBuildTarget<cr>' }
        },
    },
}
