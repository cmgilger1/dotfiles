local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup({
  defaults = {
    mappings = {
      -- i = {
      --   ["<esc>"] = actions.close
      -- },
    },
    prompt_prefix = "   ",
    selection_caret = " ❯ ",
    entry_prefix = "   ",
    multi_icon = "+ ",
    sorting_strategy = 'ascending',
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim" -- add this value
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
              "--no-ignore",
              "--glob=!.cache",
              "--glob=!.git",
              "--glob=!lib",
              "--glob=!build",
              "--files",
              "--smart-case",
          },
          mappings = {
              n = {
                  ['J'] = actions.preview_scrolling_down,
                  ['K'] = actions.preview_scrolling_up,
              }
         }
      },
      grep_string = {
          initial_mode = 'normal',
          mappings = {
              n = {
                  ['J'] = actions.preview_scrolling_down,
                  ['K'] = actions.preview_scrolling_up
              }
          }
      },
      live_grep = {
          mappings = {
              n = {
                  ['J'] = actions.preview_scrolling_down,
                  ['K'] = actions.preview_scrolling_up
              }
          }
      },
      git_bcommits = {
          mappings = {
              n = {
                  ['<cr>'] = actions.select_vertical,
                  ['J'] = actions.preview_scrolling_down,
                  ['K'] = actions.preview_scrolling_up
              }
          },
          initial_mode = 'normal'
      },
      git_commits = {
          mappings = {
              n = {
                  ['<cr>'] = actions.select_vertical,
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

-- live_grep current node
local t = require('telescope.builtin')
local function grep_at_current_tree_node()
    -- local node = require('nvim-tree.api').tree.get_node_under_cursor()
    -- if not node then 
        t.live_grep()
    -- else
    --     t.live_grep({search_dirs = {node.absolute_path}})
    -- end
end

vim.keymap.set('n', '<leader>ff', t.find_files, {})
vim.keymap.set('n', '<leader>lg', grep_at_current_tree_node, {})
vim.keymap.set('n', '<leader>fs', t.grep_string, {})
vim.keymap.set('n', '<leader>fb', t.buffers, {})
vim.keymap.set('n', '<leader>fh', t.help_tags, {})
vim.keymap.set('n', '<leader>co', t.git_commits, {})
vim.keymap.set('n', '<leader>fco', t.git_bcommits, {})
vim.keymap.set('n', '<leader>br', t.git_branches, {})
vim.keymap.set('n', '<leader>gs', t.git_status, {})
