return {
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
           local alpha = require('alpha')
           local dashboard = require('alpha.themes.dashboard')
           dashboard.section.header.val = {
               [[  .---.    .--.      .-..      .-..   ]],
               [[ / .-, \  /    \    /    \    /    \  ]],
               [[(__) ; | |  .-. ;  ' .-,  ;  ' .-,  ; ]],
               [[  .'`  | |  | | |  | |  . |  | |  . | ]],
               [[ / .'| | |  |/  |  | |  | |  | |  | | ]],
               [[| /  | | |  ' _.'  | |  | |  | |  | | ]],
               [[; |  ; | |  .'.-.  | |  ' |  | |  ' | ]],
               [[' `-'  | '  `-' /  | `-'  '  | `-'  ' ]],
               [[`.__.'_.  `.__.'   | \__.'   | \__.'  ]],
               [[                   | |       | |      ]],
               [[                  (___)     (___)     ]]
           }
           dashboard.section.header.opts.hl = "Keyword"
           dashboard.section.buttons.val = {
               dashboard.button("e", "  > New file", ":lua require('core.utils.utils').create_new_file()<CR>"),
               dashboard.button("f", "  > Find file", ":FzfLua files <CR>"),
               dashboard.button("r", "  > Recent", ":FzfLua oldfiles<CR>"),
               dashboard.button("l", "󰒲  > Lazy", ":Lazy<CR>"),
               dashboard.button("t", "󱩾  > Find text", ":FzfLua live_grep <CR>"),
               dashboard.button("q", "󰗼  > Quit Neovim", ":qa<CR>"),
           }
           local handle = io.popen('fortune')
           local fortune = handle:read("*a")
           handle:close()
           dashboard.section.footer.val = fortune
           alpha.setup(dashboard.config)
        end,
    },
}

