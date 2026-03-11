return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- Eviline config for lualine
        -- Author: shadmansaleh
        -- Credit: glepnir
        local lualine = require('lualine')
        local cmake = require('cmake-tools')

        -- catppuccin mocha
        local colors = {
            bg       = '#303446',
            fg       = '#c6d0f5',
            yellow   = '#e6c07b',
            cyan     = '#81c8be',
            darkblue = '#8caaee',
            green    = '#a6d189',
            orange   = '#e5c890',
            violet   = '#f4b8e4',
            magenta  = '#f4b8e4',
            blue     = '#8caaee',
            red      = '#e78284',
        }


        -- catppuccin mocha
        -- local colors = {
        --     bg       = '#1e1e2e',
        --     fg       = '#d6d6d6',
        --     yellow   = '#e6c07b',
        --     cyan     = '#54afbc',
        --     darkblue = '#61afef',
        --     green    = '#98c379',
        --     orange   = '#e5c07b',
        --     violet   = '#634962',
        --     magenta  = '#c678dd',
        --     blue     = '#61afef',
        --     red      = '#e86671',
        -- }

        -- catppuccin latte
        -- local colors = {
        --     bg       = '#eff1f5',
        --     fg       = '#4c4f69',
        --     yellow   = '#df8e1d',
        --     cyan     = '#179299',
        --     darkblue = '#1e66f5',
        --     green    = '#40a02b',
        --     orange   = '#d20f39',
        --     violet   = '#ea76cb',
        --     magenta  = '#ea76cb',
        --     blue     = '#1e66f5',
        --     red      = '#d20f39',
        -- }

               
        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand('%:p:h')
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        -- Config
        local config = {
            options = {
                -- Disable sections and component separators
                component_separators = '',
                section_separators = '',
                theme = {
                    -- We are going to use lualine_c an lualine_x as left and
                    -- right section. Both are highlighted by c theme .  So we
                    -- are just setting default looks o statusline
                    normal = { c = { fg = colors.fg, bg = colors.bg } },
                    inactive = { c = { fg = colors.fg, bg = colors.bg } },
                },
            },
            sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                -- These will be filled later
                lualine_c = {},
                lualine_x = {},
            },
            inactive_sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
        }

        -- Inserts a component in lualine_c at left section
        local function ins_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        -- Inserts a component in lualine_x at right section
        local function ins_right(component)
            table.insert(config.sections.lualine_x, component)
        end

        ins_left {
            'filename',
            cond = conditions.buffer_not_empty,
            color = { fg = colors.magenta },
        }

        ins_left { 'location' }

        ins_left {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.yellow },
                info = { fg = colors.cyan },
            },
        }

        -- Insert mid section. You can make any number of sections in neovim :)
        -- for lualine it's any number greater then 2
        ins_left {
            function()
                return '%='
            end,
        }

        ins_left {
            function()
                local type = cmake.get_build_type()
                return "Build Type : [" .. (type or "X") .. "]"
            end,
            cond = cmake.is_cmake_project,
        }

        ins_left {
            function()
                local b_preset = cmake.get_build_preset()
                return "Build Preset: [" .. (b_preset or "X") .. "]"
            end,
            cond = cmake.is_cmake_project,
        }

        ins_left {
            function()
                local b_target = cmake.get_build_target()
                return "Target : [" .. (b_target or "X") .. "]"
            end,
            cond = cmake.is_cmake_project,
        }

        ins_right {
            -- Lsp server name .
            function()
                local msg = 'No Active Lsp'
                local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            icon = ' ',
            color = { fg = colors.cyan },
        }

        -- Add components to right sections
        ins_right {
            'o:encoding', -- option component same as &encoding in viml
            fmt = string.upper, -- I'm not sure why it's upper case either ;)
            cond = conditions.hide_in_width,
            color = { fg = colors.green },
        }

        ins_right {
            'fileformat',
            fmt = string.upper,
            icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
            color = { fg = colors.green },
        }

        ins_right {
            'branch',
            icon = '',
            color = { fg = colors.violet },
        }

        ins_right {
            function()
                return ' '
            end,
            padding = { left = 1 },
        }

        -- Now don't forget to initialize lualine
        lualine.setup(config)

    end

}
