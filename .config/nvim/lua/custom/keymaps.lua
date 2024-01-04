-- some generic mappings
vim.keymap.set('n', '>', ';', {}) -- remap ; (leader) to >
vim.keymap.set('n', '<', ',', {}) -- because this makes sense
vim.keymap.set('n', '<leader>nh', '<cmd>nohl<cr>', {}) -- toggle nohl
vim.keymap.set('n', '<leader>j', 'J', {}) -- first map <leader>j to join()
vim.keymap.set('n', 'J', '<C-f>zz', {})   -- then map J & K to scroll
vim.keymap.set('n', 'K', '<C-b>zz', {})
vim.keymap.set('n', 'L', '<cmd>tabn<cr>', {})
vim.keymap.set('n', 'H', '<cmd>tabp<cr>', {})
vim.keymap.set('n', '<leader>1', '1gt', {})
vim.keymap.set('n', '<leader>2', '2gt', {})
vim.keymap.set('n', '<leader>3', '3gt', {})
vim.keymap.set('n', '<leader>4', '4gt', {})
vim.keymap.set('n', '<leader>5', '5gt', {})
vim.keymap.set('n', '<leader>6', '6gt', {})
vim.keymap.set('n', '<leader>7', '7gt', {})
vim.keymap.set('n', '<leader>8', '8gt', {})
vim.keymap.set('n', '<leader>9', '9gt', {})
vim.keymap.set("n", "<leader>ws", "<cmd>set list!<CR>", {silent = true}) -- toggle whitespace
vim.keymap.set("n", "<leader>ln", "<cmd>set relativenumber!<CR>", {silent = true}) -- toggle whitespace

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "paste AFTER from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]], { desc = "paste BEFORE from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "yank AFTER from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]], { desc = "yank BEFORE from clipboard" })
vim.keymap.set({'n', 'i', 'v'}, '<C-h>', '<C-w>h', {})
vim.keymap.set({'n', 'i', 'v'}, '<C-l>', '<C-w>l', {})
vim.keymap.set({'n', 'i', 'v'}, '<C-k>', '<C-w>k', {})
vim.keymap.set({'n', 'i', 'v'}, '<C-j>', '<C-w>j', {})

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
vim.keymap.set({'n'}, '<leader>qf', toggle_quickfix, {})

