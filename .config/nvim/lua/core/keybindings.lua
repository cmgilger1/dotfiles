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

map({ "n", "v" }, "<leader>p", [["+p]])
map({ "n", "v" }, "<leader>P", [["+P]])
map({ "n", "v" }, "<leader>y", [["+y]])
map({ "n", "v" }, "<leader>Y", [["+Y]])

-- easy pane movements
map({ 'n', 'i', 'v' }, '<C-h>', '<C-w>h')
map({ 'n', 'i', 'v' }, '<C-l>', '<C-w>l')
map({ 'n', 'i', 'v' }, '<C-k>', '<C-w>k')
map({ 'n', 'i', 'v' }, '<C-j>', '<C-w>j')

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
--
-- -- Command mode
-- map("c", "<C-p>", "<Up>")
-- map("c", "<C-n>", "<Down>")
--
-- overseer
map('n', '<leader>cc', '<cmd>OverseerRun dmake<cr>')
map('n', '<leader>bb', '<cmd>OverseerRun dbake<cr>')
map('n', '<leader>rb', '<cmd>OverseerRestartLast<cr>')
map('n', '<leader>ot', '<cmd>OverseerToggle<cr>')
map('n', '<leader>oc', '<cmd>OverseerRunCmd<cr>')

-- Telescope
map("n", "<leader><space>", "<CMD>FzfLua files<CR>")
map("n", "<leader>fg", "<CMD>FzfLua live_grep<CR>")
map("n", "<leader>fb", "<CMD>FzfLua buffers<CR>")
map('n', '<leader>fs', "<CMD>FzfLua grep_cword<CR>")
map('n', '<leader>br', "<CMD>FzfLua git_branches<CR>")
map('n', '<leader>gs', "<CMD>FzfLua git_status<CR>")
map('n', '<leader>/', "<CMD>FzfLua lgrep_curbuf<CR>")

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
map("n", "<leader>tf", "<CMD>ToggleTerm direction=float<CR>", { desc = "new tabbed terminal" })
map("n", "<leader>tv", "<CMD>ToggleTerm direction=vertical<CR>", { desc = "new tabbed terminal" })
map("n", "<leader>tx", "<CMD>ToggleTerm direction=horizontal<CR>", { desc = "new tabbed terminal" })
map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
map({'n', 'i'}, '<C-h>', '<C-w><h>', opts)
map({'n', 'i'}, '<C-j>', '<C-w><j>', opts)
map({'n', 'i'}, '<C-k>', '<C-w><k>', opts)
map({'n', 'i'}, '<C-l>', '<C-w><l>', opts)

-- Hop
map("n", "<leader>m", "<CMD>HopWord<CR>")

-- CodeSnap
map({'x'}, '<leader>sn', '<cmd>CodeSnap<cr>')

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
