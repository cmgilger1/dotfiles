return {
    cmd = {'clangd', '--background-index', '--clang-tidy'},
    init_options = {
        fallbackFlags = { '-std=c++17' },
    },
    filetypes = { 'cpp', 'c' },
    root_markers = { '.clang-format', 'compile_commands.json' }
}
