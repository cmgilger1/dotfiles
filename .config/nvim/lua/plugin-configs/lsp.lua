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
