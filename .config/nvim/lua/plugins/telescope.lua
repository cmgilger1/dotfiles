return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
            dependencies = {
                'junegunn/fzf.vim'
            },
            config = function()
                require('telescope').load_extension('fzf')
            end
        },
        config = function()
            local trouble = require("trouble.providers.telescope")
            local telescope = require("telescope")
            local actions = require('telescope.actions')
            telescope.setup({
                defaults = {
                    mappings = {
                        -- i = {
                        --   ["<esc>"] = actions.close
                        -- },
                        i = {
                            ["<M-j>"] = actions.move_selection_next,
                            ["<M-k>"] = actions.move_selection_previous,
                            ["<Tab>"] = actions.move_selection_next,
                            ["<S-Tab>"] = actions.move_selection_previous
                        }

                    },
                    prompt_prefix = "   ",
                    selection_caret = " ❯ ",
                    entry_prefix = "   ",
                    multi_icon = "+ ",
                    sorting_strategy = 'ascending',
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-ignore",
                        "--glob=!build",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--trim"
                    },
                    layout_config = {
                        prompt_position = 'top'
                    },
                    scroll_strategy = 'limit'
                },
                pickers = {
                    find_files = {
                        find_command = {
                            "rg",
                            "--no-heading",
                            "--with-filename",
                            "--line-number",
                            "--column",
                            "--hidden",
                            "--glob=!.cache",
                            "--glob=!.git",
                            "--glob=!build",
                            "--files",
                            "--smart-case",
                        },
                        no_ignore = true,
                        no_ignore_parent = true,
                        mappings = {
                            n = {
                                ['s'] = actions.select_vertical,
                                ['x'] = actions.select_horizontal,
                                ['J'] = actions.preview_scrolling_down,
                                ['K'] = actions.preview_scrolling_up,
                            }
                        }
                    },
                    grep_string = {
                        initial_mode = 'normal',
                        mappings = {
                            n = {
                                ['s'] = actions.select_vertical,
                                ['x'] = actions.select_horizontal,
                                ['J'] = actions.preview_scrolling_down,
                                ['K'] = actions.preview_scrolling_up
                            }
                        }
                    },
                    live_grep = {
                        mappings = {
                            n = {
                                ['s'] = actions.select_vertical,
                                ['x'] = actions.select_horizontal,
                                ['J'] = actions.preview_scrolling_down,
                                ['K'] = actions.preview_scrolling_up
                            }
                        }
                    },
                    buffers = {
                        initial_mode = 'normal',
                        mappings = {
                            n = {
                                ['s'] = actions.select_vertical,
                                ['x'] = actions.select_horizontal
                            }
                        }
                    },
                    git_bcommits = {
                        mappings = {
                            n = {
                                ['s'] = actions.select_vertical,
                                ['x'] = actions.select_horizontal,
                                ['J'] = actions.preview_scrolling_down,
                                ['K'] = actions.preview_scrolling_up
                            }
                        },
                        initial_mode = 'normal'
                    },
                    git_commits = {
                        mappings = {
                            n = {
                                ['s'] = actions.select_vertical,
                                ['x'] = actions.select_horizontal,
                                ['J'] = actions.preview_scrolling_down,
                                ['K'] = actions.preview_scrolling_up
                            }
                        },
                        initial_mode = 'normal'
                    },
                    git_branches = {
                        show_remote_tracking_branches = false,
                        initial_mode = 'normal',
                        mappings = {
                            n = {
                                ['J'] = actions.preview_scrolling_down,
                                ['K'] = actions.preview_scrolling_up
                            }
                        }
                    },
                    git_status = {
                        initial_mode = 'normal',
                        mappings = {
                            n = {
                                ['J'] = actions.preview_scrolling_down,
                                ['K'] = actions.preview_scrolling_up
                            }
                        }
                    }
                }
            })
            telescope.load_extension("aerial")
            telescope.load_extension("notify")
            telescope.load_extension("noice")
            telescope.load_extension("projects")
        end,
    },
}
