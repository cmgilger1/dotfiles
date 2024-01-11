require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "cpp", "qmldir", "bash", "lua", "vim", "vimdoc", "query" },
	sync_install = false,
	auto_install = true,
	highlight = {
	  enable = true,
	  additional_vim_regex_highlighting = true,
	},
	incremental_selection = { enable = true },
	autotag = { enable = true },
	rainbow = { enable = true, disable = { "html" }, extended_mode = false },
})

require("ts_context_commentstring").setup({
	enable_autocmd = false,
})
