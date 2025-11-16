return {
    cmd = { 'lua-language-server', '--logpath=/tmp/luals'},
    filetypes = { 'lua' },
    root_markers = { '.git' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals =  { 'vim' }
            }
        }
    }
}
