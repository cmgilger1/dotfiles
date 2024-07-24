local map = require("core.utils.utils").map

vim.g.mapleader = " " -- the leader key is the spacebar
-- Trouble
map("n", "<leader>tr", "<CMD>TroubleToggle lsp_references<CR>")
map("n", "<leader>td", "<CMD>TroubleToggle lsp_definitions<CR>")
map("n", "<leader>cd", "<CMD>TroubleToggle<CR>")

-- some generic mappings
map('n', '<leader>hh', '<cmd>nohl<cr>') -- toggle nohl
map('n', '<leader>j', 'J')              -- first map <leader>j to join()

-- Zen mode
map("n", "<leader>zm", "<CMD>ZenMode<CR>")

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

-- toggle quick fix
local function toggle_quickfix()
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
map("n", "<leader>nt", "<CMD>Neotree show toggle reveal left<CR>")
map("n", "<leader>nf", "<CMD>Neotree toggle reveal float<CR>")

-- Aerial
map("n", "<leader>at", "<CMD>AerialToggle right<CR>")

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
map('n', '<leader>/', "<CMD>Telescope current_buffer_fuzzy_find<CR>")

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
map('n', '<space>e', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<space>q', vim.diagnostic.setloclist)

-- ToggleTerm
local git_root = "cd $(git rev-parse --show-toplevel 2>/dev/null) && clear"
map("n", "<c-t>", "<CMD>ToggleTerm direction=float<CR>", { desc = "new tabbed terminal" })

map('n', '<C-h>', '<C-w><h>', opts)
map('n', '<C-j>', '<C-w><j>', opts)
map('n', '<C-k>', '<C-w><k>', opts)
map('n', '<C-l>', '<C-w><l>', opts)

-- Hop
map("n", "<leader>m", "<CMD>HopWord<CR>")

-- CodeSnap
map({'n', 'v'}, '<leader>sn', '<cmd>CodeSnap<cr>')

-- Fugitive 
map("n", "<leader>gg", "<CMD>G<CR>")
map("n", "<leader>bl", "<CMD>Git blame<CR>")

-- autosave
map("n", "<leader>as", "<CMD>ASToggle<CR>", { desc = "toggle autosave" })

-- window resize
map('n', 'wj', '<cmd>horizontal resize -2<cr>')
map('n', 'wk', '<cmd>horizontal resize +2<cr>')
map('n', 'wh', '<cmd>vertical resize -2<cr>')
map('n', 'wl', '<cmd>vertical resize +2<cr>')
