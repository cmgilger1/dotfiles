local if_nil = vim.F.if_nil

local default_terminal = {
    type = "terminal",
    command = nil,
    width = 69,
    height = 8,
    opts = {
        redraw = true,
        window_config = {},
    },
}

local default_header = {
    type = "text",
    val = {
        [[         _          __________                              _,]],
        [[     _.-(_)._     ."          ".      .--""--.          _.-{__}-._]],
        [[   .'________'.   | .--------. |    .'        '.      .:-'`____`'-:.]],
        [[  [____________] /` |________| `\  /   .'``'.   \    /_.-"`_  _`"-._\]],
        [[  /  / .\/. \  \|  / / .\/. \ \  ||  .'/.\/.\'.  |  /`   / .\/. \   `\]],
        [[  |  \__/\__/  |\_/  \__/\__/  \_/|  : |_/\_| ;  |  |    \__/\__/    |]],
        [[  \            /  \            /   \ '.\    /.' / .-\                /-.]],
        [[  /'._  --  _.'\  /'._  --  _.'\   /'. `'--'` .'\/   '._-.__--__.-_.'   \]],
        [[ /_   `""""`   _\/_   `""""`   _\ /_  `-./\.-'  _\'.    `""""""""`    .'`\]],
        [[(__/    '|    \ _)_|           |_)_/            \__)|        '       |   |]],
        [[  |_____'|_____|   \__________/   |              |;`_________'________`;-']],
        [[   '----------'    '----------'   '--------------'`--------------------`]],
    },
    opts = {
        position = "center",
        hl = "Function",
        -- wrap = "overflow";
    },
}


local default_sub_header = {
    type = "text",
    val = {
        [[   _____  _______________________________ ]],
        [[  /  _  \ \_   _____/\______   \______   \]],
        [[ /  /_\  \ |    __)_  |     ___/|     ___/]],
        [[/    |    \|        \ |    |    |    |    ]],
        [[\____|__  /_______  / |____|    |____|    ]],
        [[        \/        \/                     ]],
    },
    opts = {
        position = "center",
        hl = "Special",
        -- wrap = "overflow";
    },
}

local footer = {
    type = "text",
    val = "",
    opts = {
        position = "center",
        hl = "Number",
    },
}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 3,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
    }
    if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button("e", "  > New file", ":lua require('core.utils.utils').create_new_file()<CR>"),
        button("f", "  > Find file", ":Telescope find_files <CR>"),
        button("r", "  > Recent", ":Telescope oldfiles<CR>"),
        button("l", "󰒲  > Lazy", ":Lazy<CR>"),
        button("t", "󱩾  > Find text", ":Telescope live_grep <CR>"),
        button("q", "󰗼  > Quit Neovim", ":qa<CR>"),
    },
    opts = {
        spacing = 1,
    },
}

local section = {
    terminal = default_terminal,
    header = default_header,
    sub_header = default_sub_header,
    buttons = buttons,
    footer = footer,
}

local config = {
    layout = {
        { type = "padding", val = 2 },
        section.header,
        { type = "padding", val = 2 },
        section.sub_header,
        { type = "padding", val = 2 },
        section.buttons,
        section.footer,
    },
    opts = {
        margin = 5,
    },
}

return {
    button = button,
    section = section,
    config = config,
    -- theme config
    leader = leader,
    -- deprecated
    opts = config,
}
