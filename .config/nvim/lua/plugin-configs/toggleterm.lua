require("toggleterm").setup({
	open_mapping = [[<leader>tt]],
	on_open = function(_term)
		vim.cmd("startinsert!")
	end,
	on_close = function(_term)
		vim.cmd("startinsert!")
	end,
	direction = "float",
    insert_mappings = false,
    close_on_exit = true,
	float_opts = {
		border = "curved",
		winblend = 6,
        width = 120,
	},
})
