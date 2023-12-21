local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local cmake = require("cmake-tools")
local icons = require("modules.icons")

-- Credited to [evil_lualine](https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua)
local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 150
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
  is_tree = function()
    return string.find(vim.fn.expand('%t'), 'NvimTree') ~= nil
  end,
}


local colors = require("catppuccin.palettes").get_palette "mocha"
	-- rosewater = "#f5e0dc",
	-- flamingo = "#f2cdcd",
	-- pink = "#f5c2e7",
	-- mauve = "#cba6f7",
	-- red = "#f38ba8",
	-- maroon = "#eba0ac",
	-- peach = "#fab387",
	-- yellow = "#f9e2af",
	-- green = "#a6e3a1",
	-- teal = "#94e2d5",
	-- sky = "#89dceb",
	-- sapphire = "#74c7ec",
	-- blue = "#89b4fa",
	-- lavender = "#b4befe",
	-- text = "#cdd6f4",
	-- subtext1 = "#bac2de",
	-- subtext0 = "#a6adc8",
	-- overlay2 = "#9399b2",
	-- overlay1 = "#7f849c",
	-- overlay0 = "#6c7086",
	-- surface2 = "#585b70",
	-- surface1 = "#45475a",
	-- surface0 = "#313244",
	-- base = "#1e1e2e",
	-- mantle = "#181825",
	-- crust = "#11111b",

local config = {
  options = {
    icons_enabled = true,
    component_separators = "",
    section_separators = "",
    disabled_filetypes = { "alpha", "dashboard", "Outline" },
    always_divide_middle = true,
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.mantle } },
      inactive = { c = { fg = colors.fg, bg = colors.mantle } },
    },
  },
  globalstatus = true,
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- c for left
    lualine_c = {},
    -- x for right
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  tabline = {},
  extensions = { 'nvim-tree', 'quickfix' },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end
local function ins_inactive_left(component)
  table.insert(config.inactive_sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

local function ins_inactive_right(component)
  table.insert(config.inactive_sections.lualine_x, component)
end

ins_left {
  function()
    return icons.ui.Line
  end,
  color = { fg = colors.sapphire }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return icons.ui.Fire
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      ["␖"] = colors.blue,
      V = colors.blue,
      c = colors.pink,
      no = colors.red,
      s = colors.yellow,
      S = colors.yellow,
      ["␓"] = colors.yellow,
      ic = colors.yellow,
      R = colors.mauve,
      Rv = colors.mauve,
      cv = colors.red,
      ce = colors.red,
      r = colors.teal,
      rm = colors.teal,
      ["r?"] = colors.teal,
      ["!"] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

-- ins_left {
--   -- filesize component
--   "filesize",
--   cond = conditions.buffer_not_empty,
-- }

ins_left {
  "filename",
  cond = function()
      return conditions.buffer_not_empty() and not conditions.is_tree()
  end,
  color = { fg = colors.lavender },
}
ins_inactive_left {
  "filename",
  cond = function()
      return conditions.buffer_not_empty() and not conditions.is_tree()
  end,
  color = { fg = colors.lavender },
}

ins_left { "location" }
ins_inactive_left { "location" }

ins_left {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = icons.diagnostics.Error, warn = icons.diagnostics.Warning, info = icons.diagnostics.Information },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.teal },
  },
}

ins_left {
  function()
    local c_preset = cmake.get_configure_preset()
    return "" .. (c_preset and c_preset or "No Configure Preset Selected") .. ""
  end,
  icon = icons.kind.Tool,
  cond = function()
    return cmake.is_cmake_project() and cmake.has_cmake_preset() and not conditions.is_tree()
  end,
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd("CMakeSelectConfigurePreset")
      end
    end
  end
}

ins_left {
  function()
    local type = cmake.get_build_type()
    return " Build Type: [" .. (type and type or "") .. "]"
  end,
  icon = icons.kind.Tool,
  cond = function()
    return cmake.is_cmake_project() and not cmake.has_cmake_preset() and not conditions.is_tree()
  end,
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd("CMakeSelectBuildType")
      end
    end
  end
}

ins_left {
  function()
    local kit = cmake.get_kit()
    return " [" .. (kit and kit or "No active kit") .. "]"
  end,
  icon = icons.ui.Pencil,
  cond = function()
    return cmake.is_cmake_project() and not cmake.has_cmake_preset() and not conditions.is_tree()
  end,
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd("CMakeSelectKit")
      end
    end
  end
}

-- ins_left {
--   function()
--     return " Build"
--   end,
--   icon = icons.ui.Gear,
--   cond = function()
--       return cmake.is_cmake_project() and not conditions.is_tree()
--   end,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeBuild")
--       end
--     end
--   end
-- }

ins_left {
  function()
    local c_preset = cmake.get_build_preset()
    return " " .. (c_preset and c_preset or "No Build Preset Selected") .. ""
  end,
  icon = icons.ui.Gear,
  cond = function()
    return cmake.is_cmake_project() and cmake.has_cmake_preset() and not conditions.is_tree()
  end,
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd("CMakeSelectBuildPreset")
      end
    end
  end
}

ins_left {
  function()
    local b_target = cmake.get_build_target()
    return " " .. (b_target and b_target or "unspecified") .. ""
  end,
  icon = icons.misc.Tag,
  cond = function()
      return cmake.is_cmake_project() and not conditions.is_tree()
  end,
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd("CMakeSelectBuildTarget")
      end
    end
  end
}

-- ins_left {
--   function()
--     return icons.ui.Debug
--   end,
--   cond = cmake.is_cmake_project,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeDebug")
--       end
--     end
--   end
-- }

-- ins_left {
--   function()
--     return icons.ui.Run
--   end,
--   cond = cmake.is_cmake_project,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeRun")
--       end
--     end
--   end
-- }

-- ins_left {
--   function()
--     local l_target = cmake.get_launch_target()
--     return "[" .. (l_target and l_target or "unspecified") .. "]"
--   end,
--   cond = cmake.is_cmake_project,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeSelectLaunchTarget")
--       end
--     end
--   end
-- }

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return "%="
  end,
}

-- Add components to right sections
-- ins_right {
--   "o:encoding", -- option component same as &encoding in viml
--   fmt = string.upper, -- I'm not sure why it's upper case either ;)
--   cond = function()
--     return conditions.hide_in_width() and not conditions.is_tree()
--   end,
--   color = { fg = colors.green },
-- }

ins_right {
  "fileformat",
  fmt = string.upper,
  icons_enabled = false,
  cond = function()
    return not conditions.is_tree()
  end,
  color = { fg = colors.green },
}

-- ins_right {
--   function()
--     return vim.api.nvim_buf_get_option(0, "shiftwidth")
--   end,
--   icons_enabled = false,
--   color = { fg = colors.green },
-- }

ins_right {
  "branch",
  icon = "",
  cond = function()
      return conditions.hide_in_width() and not conditions.is_tree()
  end,
  color = { fg = colors.mauve },
}
ins_inactive_right {
  "branch",
  icon = "",
  cond = function()
      return not conditions.is_tree()
  end,
  color = { fg = colors.mauve },
}

ins_right {
  "diff",
  -- Is it me or the symbol for modified us really weird
  symbols = { added = icons.git.Add, modified = icons.git.Mod , removed = icons.git.Remove },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
  cond = function()
      return cmake.is_cmake_project() and not conditions.is_tree()
  end 
}

-- ins_right {
--   function()
--     local current_line = vim.fn.line(".")
--     local total_lines = vim.fn.line("$")
--     local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
--     local line_ratio = current_line / total_lines
--     local index = math.ceil(line_ratio * #chars)
--     return chars[index]
--   end,
--   color = { fg = colors.yellow, gui = "bold" }
-- }

ins_right {
  function()
    return "▊"
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
