local map = require("core.utils.utils").map

vim.g.mapleader = " " -- the leader key is the spacebar

-- some generic mappings
map('n', '<leader>hh', '<cmd>nohl<cr>') -- toggle nohl

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

map({ 'n' }, '<leader>cn', '<cmd>NoiceDismiss<cr>')

-- Oil
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

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

-- overseer
map('n', '<leader>bb', '<cmd>CMakeBuild<cr>')
map('n', '<leader>ot', '<cmd>OverseerToggle<cr>')


-- More LSP stuff
-- lsp agnostic global rename
map("n", "rg", ":%s/<C-r><C-w>//g<Left><Left>", { desc = "global substitution" })
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
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
map('n', '<space>k', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<space>q', vim.diagnostic.setloclist)

-- autosave
map("n", "<leader>as", "<CMD>ASToggle<CR>", { desc = "toggle autosave" })

-- window resize
map('n', 'wj', '<cmd>horizontal resize -2<cr>')
map('n', 'wk', '<cmd>horizontal resize +2<cr>')
map('n', 'wh', '<cmd>vertical resize -2<cr>')
map('n', 'wl', '<cmd>vertical resize +2<cr>')

local function hide_diagnostics()
    vim.diagnostic.config({  -- https://neovim.io/doc/user/diagnostic.html
        virtual_lines = false,
        signs = false,
        underline = false,
    })
end
local function show_diagnostics()
    vim.diagnostic.config({
        virtual_lines = {
            current_line = true
        },
        signs = {
            active = true,
            text = {
              [vim.diagnostic.severity.ERROR] = "",
              [vim.diagnostic.severity.WARN]  = "",
              [vim.diagnostic.severity.HINT]  = "󰟃",
              [vim.diagnostic.severity.INFO]  = "",
            },
        },
    })
end
vim.keymap.set("n", "<leader>dh", hide_diagnostics)
vim.keymap.set("n", "<leader>ds", show_diagnostics)
