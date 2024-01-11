local map = require("core.utils.utils").map

vim.g.mapleader = " " -- the leader key is the spacebar
local M = {}

-- DAP
_G.dap = require("dap")
map("n", "<leader>dc", "<CMD>lua dap.continue()<CR>")
map("n", "<leader>n", "<CMD>lua dap.step_over()<CR>")
map("n", "<leader>si", "<CMD>lua dap.step_into()<CR>")
map("n", "<leader>so", "<CMD>lua dap.step_out()<CR>")
map("n", "<leader>tb", "<CMD>lua dap.toggle_breakpoint()<CR>")
map("n", "<leader>dq", "<CMD>lua dap.disconnect({ terminateDebuggee = true })<CR>")

-- Trouble
map("n", "<leader>tr", "<CMD>TroubleToggle lsp_references<CR>")
map("n", "<leader>td", "<CMD>TroubleToggle lsp_definitions<CR>")
map("n", "<leader>cd", "<CMD>TroubleToggle<CR>")

-- UFO
map("n", "zR", "<CMD>lua require('ufo').openAllFolds()<CR>")
map("n", "zM", "<CMD>lua require('ufo').closeAllFolds()<CR>")

-- some generic mappings
map('n', '>', ';')                      -- remap ; (leader) to >
map('n', '<', ',')                      -- because this makes sense
map('n', '<leader>hh', '<cmd>nohl<cr>') -- toggle nohl
map('n', '<leader>j', 'J')              -- first map <leader>j to join()

-- Neoscroll
local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '350', [['sine']] } }
t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '350', [['sine']] } }
-- Use the "circular" easing function
t['K'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '200', [['circular']] } }
t['J'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '200', [['circular']] } }
require('neoscroll.config').set_mappings(t)

-- toggle whitespace
map("n", "<leader>ws", "<cmd>set list!<CR>")

-- toggle relative line numbers
map("n", "<leader>ln", "<cmd>set relativenumber!<CR>")

-- clipboard copy/pasting
vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
        ['+'] = 'win32yank.exe -i --crlf',
        ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
        ['+'] = 'win32yank.exe -o --lf',
        ['*'] = 'win32yank.exe -o --lf',
    }
}
map({ "n", "v" }, "<leader>p", [["+p]])
map({ "n", "v" }, "<leader>P", [["+P]])
map({ "n", "v" }, "<leader>y", [["+y]])
map({ "n", "v" }, "<leader>Y", [["+Y]])

-- easy pane movements
map({ 'n', 'i', 'v' }, '<C-h>', '<C-w>h')
map({ 'n', 'i', 'v' }, '<C-l>', '<C-w>l')
map({ 'n', 'i', 'v' }, '<C-k>', '<C-w>k')
map({ 'n', 'i', 'v' }, '<C-j>', '<C-w>j')

-- hjkl movements in insert mode
map('i', '<M-h>', '<left>')
map('i', '<M-l>', '<right>')
map('i', '<M-k>', '<up>')
map('i', '<M-j>', '<down>')

-- STOP USING ARROW KEYS
map({ 'n', 'i', 'v' }, '<up>', '<nop>')
map({ 'n', 'i', 'v' }, '<down>', '<nop>')
map({ 'n', 'i', 'v' }, '<left>', '<nop>')
map({ 'n', 'i', 'v' }, '<right>', '<nop>')

-- toggle quick fix
function toggle_quickfix()
    local windows = vim.fn.getwininfo()
    for _, win in pairs(windows) do
        if win["quickfix"] == 1 then
            vim.cmd.cclose()
            return
        end
    end
    vim.cmd.copen()
end

map({ 'n' }, '<leader>qf', toggle_quickfix)

-- NeoTree
map("n", "<leader>nt", "<CMD>Neotree reveal left<CR>")
map("n", "<leader>nf", "<CMD>Neotree reveal float<CR>")
map("n", "<leader>nc", "<CMD>Neotree close<CR>")

-- Aerial
map("n", "<leader>at", "<CMD>AerialToggle<CR>")

-- Searching and Highlighting
map("n", "m", "<CMD>noh<CR>")

-- Movement
-- in insert mode, type <c-d> and your cursor will move past the next separator
-- such as quotes, parens, brackets, etc.
map("i", "<C-d>", "<left><c-o>/[\"';)>}\\]]<cr><c-o><CMD>noh<cr><right>")
map("i", "<C-b>", "<C-o>0")
map("i", "<C-a>", "<C-o>A")

-- Command mode
map("c", "<C-p>", "<Up>")
map("c", "<C-n>", "<Down>")

-- CMake Tools
map('n', '<leader>bb', '<cmd>CMakeBuild<cr>')
map('n', '<leader>bg', '<cmd>CMakeGenerate<cr>')
map('n', '<leader>bt', '<cmd>CMakeSelectBuildTarget<cr>')
map('n', '<leader>bp', '<cmd>CMakeSelectBuildPreset<cr>')
map('n', '<leader>cp', '<cmd>CMakeSelectConfigurePreset<cr>')
map('n', '<leader>cc', '<cmd>CMakeClose<cr>')

-- Telescope
map("n", "<leader><space>", "<CMD>Telescope find_files<CR>")
map("n", "<leader>ff", "<CMD>Telescope git_files hidden=true<CR>", { desc = "Telescope Find Files" })
map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")
map("n", "<leader>fa", "<CMD>Telescope aerial<CR>")
map('n', '<leader>fs', "<CMD>Telescope grep_string<CR>")
map("n", "<leader>fp", "<CMD>Telescope projects<CR>")
map('n', '<leader>br', "<CMD>Telescope git_branches<CR>")
map('n', '<leader>gs', "<CMD>Telescope git_status<CR>")

-- Move lines and blocks
map("x", "<A-j>", ":m '>+1<CR>gv=gv")
map("x", "<A-k>", ":m '<-2<CR>gv=gv")

-- Notify
map("n", "<ESC>", "<CMD>lua require('notify').dismiss()<CR>")
map("i", "<ESC>", "<CMD>lua require('notify').dismiss()<CR><ESC>")

-- More LSP stuff
-- lsp agnostic global rename
map("n", "rg", ":%s/<C-r><C-w>//g<Left><Left>", { desc = "global substitution" })
map('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<cr>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
map({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>') 
map('n', '<M-o>', '<cmd>ClangdSwitchSourceHeader<CR>')

-- Session
map("n", "<leader>ss", "<CMD>SessionManager save_current_session<CR>")
map("n", "<leader>o", "<CMD>SessionManager load_session<CR>")

-- ToggleTerm
local git_root = "cd $(git rev-parse --show-toplevel 2>/dev/null) && clear"
-- opens terminal as a new tab at the git root
map("n", "<C-\\>t", "<CMD>ToggleTerm direction=tab<CR>", { desc = "new tabbed terminal" })
-- as a regular window
map("n", "<C-\\>", "<CMD>TermExec go_back=0 cmd='" .. git_root .. "'<CR>", { desc = "new terminal" })
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    map('t', '<esc>', [[<C-\><C-n>]], opts)
    map('t', 'jk', [[<C-\><C-n>]], opts)
    map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    map('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Hop
map("n", "<leader>m", "<CMD>HopWord<CR>")

-- Fugitive 
map("n", "<leader>gg", "<CMD>G<CR>")
map("n", "<leader>bl", "<CMD>Git blame<CR>")

-- Gitsigns

-- making this a function here because all it does is create keybinds for gitsigns but
-- it needs to be attached to an on_attach function.
M.gitsigns = function()
    local gs = package.loaded.gitsigns
    -- travel between hunks, backwards and forwards
    map("n", "]c", function()
        if vim.wo.diff then
            return "]c"
        end
        vim.schedule(function()
            gs.next_hunk()
        end)
        return "<Ignore>"
    end, { expr = true, desc = "go to previous git hunk" })
    map("n", "[c", function()
        if vim.wo.diff then
            return "[c"
        end
        vim.schedule(function()
            gs.prev_hunk()
        end)
        return "<Ignore>"
    end, { expr = true, desc = "go to next git hunk" })

    map("n", "<leader>hs", gs.stage_hunk, { desc = "stage hunk" })
    map("n", "<leader>hr", gs.reset_hunk, { desc = "reset hunk" })
    map("n", "<leader>hS", gs.stage_buffer, { desc = "stage buffer" })
    map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
    map("n", "<leader>hR", gs.reset_buffer, { desc = "reset buffer" })
    map("n", "<leader>hp", gs.preview_hunk, { desc = "preview hunk" })
    map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
    end, { desc = "complete blame line history" })
    map("n", "<leader>lb", gs.toggle_current_line_blame, { desc = "toggle blame line" })
    -- diff at current working directory
    map("n", "<leader>hd", gs.diffthis, { desc = "diff at cwd" })
    -- diff at root of git repository
    map("n", "<leader>hD", function()
        gs.diffthis("~")
    end, { desc = "diff at root of git repo" })
    map("n", "<leader>td", gs.toggle_deleted, { desc = "toggle deleted line" })
end

-- autosave
map("n", "<leader>as", "<CMD>ASToggle<CR>", { desc = "toggle autosave" })




-- cmp (these are defined in cmp's configuration file)
-- ["<C-j>"] = cmp.mapping.scroll_docs(-4),
-- ["<C-k"] = cmp.mapping.scroll_docs(4),
-- ["<C-c>"] = cmp.mapping.abort(),
-- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
-- ["<C-b>"] = cmp_action.luasnip_jump_backward(),
return M
