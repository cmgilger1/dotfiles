local augroup = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

-- disables code folding for the start screen
cmd({ "FileType" }, {
  desc = "Disable folding for alpha buffer",
  group = augroup("alpha", { clear = true }),
  pattern = "alpha",
  command = "setlocal nofoldenable",
})

-- Fixes some bugs with how treesitter manages folds
cmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
  desc = "fix tree sitter folds issue",
  group = augroup("treesitter folds", { clear = true }),
  pattern = { "*" },
  callback = function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  end,
})

-- remembers file state, such as cursor position and any folds
augroup("remember file state", { clear = true })
cmd({ "BufWinLeave" }, {
  desc = "remember file state",
  group = "remember file state",
  pattern = { "*.*" },
  command = "mkview",
})
cmd({ "BufWinEnter" }, {
  desc = "remember file state",
  group = "remember file state",
  pattern = { "*.*" },
  command = "silent! loadview",
})

-- gives you a notification upon saving a session
cmd({ "User" }, {
  desc = "notify session saved",
  group = augroup("session save", { clear = true }),
  pattern = "SessionSavePost",
  command = "lua vim.notify('Session Saved', 'info')",
})

-- enables coloring hexcodes and color names in css, jsx, etc.
cmd({ "Filetype" }, {
  desc = "activate colorizer",
  pattern = "css,scss,html,xml,svg,js,jsx,ts,tsx,php,vue",
  group = augroup("colorizer", { clear = true }),
  callback = function()
    require("colorizer").attach_to_buffer(0, {
      mode = "background",
      css = true,
    })
  end,
})

-- disables autocomplete in some filetypes
cmd({ "FileType" }, {
  desc = "disable cmp in certain filetypes",
  pattern = "gitcommit,gitrebase,text,markdown",
  group = augroup("cmp_disable", { clear = true }),
  command = "lua require('cmp').setup.buffer { enabled = false}",
})

-- fixes Trouble not closing when last window in tab
cmd("BufEnter", {
  group = vim.api.nvim_create_augroup("TroubleClose", { clear = true }),
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if
        layout[1] == "leaf"
        and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "Trouble"
        and layout[3] == nil
    then
      vim.cmd("confirm quit")
    end
  end,
})

-- https://vi.stackexchange.com/questions/1983/how-can-i-get-vim-to-stop-putting-comments-in-front-of-new-lines/1985#1985 
cmd({"FileType"}, {
  pattern = '*',
  callback = function ()
      vim.opt.formatoptions:remove({ 'o', 'r' })
  end
})
