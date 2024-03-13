-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = "nightfox"
config.font = wezterm.font 'Agave Nerd Font'
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.audible_bell = "Disabled"
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false
config.font_size = 12.5

config.mouse_bindings = {
    {
        event = { Down = { streak = 1, button = "Right" } },
        mods = "NONE",
        action = wezterm.action_callback(function(window, pane)
            local has_selection = window:get_selection_text_for_pane(pane) ~= ""
            if has_selection then
                window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
                window:perform_action(act.ClearSelection, pane)
            else
                window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
            end
        end),
    },
}

function basename(s)
    return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

local move_around = function(window, pane, direction_wez, direction_nvim)
    local result = window:active_tab():get_pane_direction(direction_wez)
    if result then
        window:perform_action(wezterm.action.ActivatePaneDirection(direction_wez), pane)
    else
        window:perform_action(wezterm.action.SendKey{ key = direction_nvim , mods = 'CTRL' }, pane)
    end
end

wezterm.on("move-left", function(window, pane)
    move_around(window, pane, "Left", "h")
end)

wezterm.on("move-right", function(window, pane)
    move_around(window, pane, "Right", "l")
end)

wezterm.on("move-up", function(window, pane)
    move_around(window, pane, "Up", "k")
end)

wezterm.on("move-down", function(window, pane)
    move_around(window, pane, "Down", "j")
end)


config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    {
        key = '%',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitPane {
            direction = 'Right',
            command = { cwd = '/home/caroline' }
        }
    },
    {
        key = '"',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitPane {
            direction = 'Down',
            command = { cwd = '/home/caroline' }
        }
    },
    {
        key = 'd',
        mods = 'LEADER',
        action = wezterm.action.SplitPane {
            direction = 'Down',
            size = { Percent = 20 }
        }
    },
    {
        key = 'z',
        mods = 'LEADER',
        action = wezterm.action.TogglePaneZoomState,
    },
    {
        key = 'c',
        mods = 'LEADER',
        action = wezterm.action.SpawnCommandInNewTab {
            cwd = '/home/caroline'
        }
    },
    {
        key = 'l',
        mods = 'LEADER',
        action = wezterm.action.ActivateLastTab,
    },
    {
        key = 'n',
        mods = 'LEADER',
        action = wezterm.action.ActivateTabRelative(1),
    },
    {
        key = 'p',
        mods = 'LEADER',
        action = wezterm.action.ActivateTabRelative(-1),
    },
    {
        key = 'h',
        mods = 'CTRL',
        action = wezterm.action{EmitEvent='move-left'}
    },
    {
        key = 'l',
        mods = 'CTRL',
        action = wezterm.action{EmitEvent='move-right'}
    },
    {
        key = 'k',
        mods = 'CTRL',
        action = wezterm.action{EmitEvent='move-up'}
    },
    {
        key = 'j',
        mods = 'CTRL',
        action = wezterm.action{EmitEvent='move-down'}
    },
    {
        key = 'a',
        mods = 'LEADER|CTRL',
        action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
    },
    {
        key = 'x',
        mods = 'LEADER',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
        key = ',',
        mods = 'LEADER',
        action = wezterm.action.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        },
    },
    {
        key = 'F11',
        action = wezterm.action.ToggleFullScreen,
    },
    {
        key = '`',
        mods = 'CTRL',
        action = wezterm.action.ActivateCommandPalette,
    },
    {
        key = 'C',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SpawnCommandInNewWindow
    },
}
for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(i - 1),
    })
end

local C = {}
-- local dividers = {
--   slant_right = {
--     left = utf8.char(0xe0be),
--     right = utf8.char(0xe0bc),
--   },
--   slant_left = {
--     left = utf8.char(0xe0ba),
--     right = utf8.char(0xe0b8),
--   },
--   arrows = {
--     left = utf8.char(0xe0b2),
--     right = utf8.char(0xe0b0),
--   },
--   rounded = {
--     left = utf8.char(0xe0b6),
--     right = utf8.char(0xe0b4),
--   },
-- }
C.div = {
    l = utf8.char(0xe0ba),
    r = utf8.char(0xe0b8),
}

C.leader = {
    enabled = true,
    off = " ",
    on = " ",
}

C.mode = {
    enabled = true,
    names = {
        resize_mode = "RESIZE",
        copy_mode = "VISUAL",
        search_mode = "SEARCH",
    }
}

C.tabs = {
    brackets = {
        active = {"",":"},
        inactive = {"",":"}
    },
}

C.clock = {
    enabled = false
}

-- set the right-hand padding to 0 spaces, if the rounded style is active
C.p = " "

-- set wezterm config options according to the parsed config
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 32

-- custom tab bar
wezterm.on( "format-tab-title", function(tab, tabs, _panes, conf, _hover, _max_width)
    local palette = conf.resolved_palette
    local colors = palette.tab_bar
    local active_tab_index = 0
    for _, t in ipairs(tabs) do
        if t.is_active == true then
            active_tab_index = t.tab_index
        end
    end
    local active_bg = colors.active_tab.bg_color
    local active_fg = colors.active_tab.fg_color
    local inactive_bg = colors.inactive_tab.bg_color
    local inactive_fg = colors.inactive_tab.fg_color
    local s_bg, s_fg, e_bg, e_fg, div
    -- the last tab
    if tab.tab_index == #tabs - 1 then
        if tab.is_active then
            s_bg = active_bg
            s_fg = active_fg
            e_bg = colors.background
            e_fg = active_bg
            div = C.div.r
        else
            s_bg = inactive_bg
            s_fg = inactive_fg
            e_bg = colors.background
            e_fg = inactive_bg
            div = C.div.r
        end
    elseif tab.tab_index == active_tab_index - 1 then
        s_bg = inactive_bg
        s_fg = inactive_fg
        e_bg = active_bg
        e_fg = inactive_bg
        div = C.div.r
    elseif tab.is_active then
        s_bg = active_bg
        s_fg = active_fg
        e_bg = inactive_bg
        e_fg = active_bg
        div = C.div.r
    else
        s_bg = inactive_bg
        s_fg = inactive_fg
        e_bg = inactive_bg
        e_fg = inactive_bg
        div = C.div.r
    end
    local index
    if tab.is_active then
        index = string.format( "%s%s%s ", C.tabs.brackets.active[1], tab.tab_index + 1, C.tabs.brackets.active[2])
    else
        index = string.format( "%s%s%s ", C.tabs.brackets.inactive[1], tab.tab_index + 1, C.tabs.brackets.inactive[2])
    end

    -- start and end hardcoded numbers are the Powerline + " " padding
    local fillerwidth = 2 + string.len(index) + 2
    local tabtitle = tab.tab_title
    local width = conf.tab_max_width - fillerwidth - 1
    if (#tabtitle + fillerwidth) > conf.tab_max_width then
        tabtitle = wezterm.truncate_right(tabtitle, width) .. "…"
    end
    local title = string.format(" %s%s%s", index, tabtitle, C.p)
    return {
        { Background = { Color = s_bg } },
        { Foreground = { Color = s_fg } },
        { Text = title },
        { Background = { Color = colors.background } },
        { Foreground = { Color = e_fg} },
        { Text = div },
        { Background = { Color = e_bg } },
        { Foreground = { Color = colors.background } },
        { Text = div },
    }
end)

wezterm.on("update-status", function(window, _pane)
    local active_kt = window:active_key_table() ~= nil
    local show = C.leader.enabled or (active_kt and C.mode.enabled)
    if not show then
        window:set_left_status("")
        return
    end

    local present, conf = pcall(window.effective_config, window)
    if not present then
        return
    end
    local palette = conf.resolved_palette
    local colors = conf.resolved_palette.tab_bar
    local bg = colors.active_tab.bg_color
    local fg = colors.inactive_tab.bg_color

    local leader = ""
    if C.leader.enabled then
        local leader_text = C.leader.off
        if window:leader_is_active() then
            leader_text = C.leader.on
        end
        leader = wezterm.format({
            { Foreground = { Color = fg } },
            { Background = { Color = bg } },
            { Text = " " .. leader_text },
        })
    end

    local mode = ""
    if C.mode.enabled then
        local mode_text = ""
        local active = window:active_key_table()
        if C.mode.names[active] ~= nil then
            mode_text = C.mode.names[active] .. ""
        end
        mode = wezterm.format({
            { Foreground = { Color = bg } },
            { Background = { Color = fg } },
            { Attribute = { Intensity = "Bold" } },
            { Text = mode_text },
            "ResetAttributes",
        })
    end

    local first_tab_active = window:mux_window():tabs_with_info()[1].is_active
    local divider_bg = first_tab_active and bg or palette.tab_bar.inactive_tab.bg_color

    local divider = wezterm.format({
        { Foreground = { Color = bg } },
        { Background = { Color = colors.background } },
        { Text = C.div.r },
        { Background = { Color = divider_bg} },
        { Foreground = { Color = colors.background} },
        { Text = C.div.r },
    })

    window:set_left_status(leader .. mode .. divider)
end)


wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            overrides.enable_tab_bar = true
        else
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
    window:toggle_fullscreen()
end)

return config
