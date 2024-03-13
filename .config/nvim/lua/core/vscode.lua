local map = require("core.utils.utils").map
-- map('n, x', '<C-j>', ':call VSCodeNotify("workbench.action.navigateDown")<CR>') 
-- map('n, x', '<C-k>', ':call VSCodeNotify("workbench.action.navigateUp")<CR>') 
-- map('n, x', '<C-h>', ':call VSCodeNotify("workbench.action.navigateLeft")<CR>') 
-- map('n, x', '<C-l>', ':call VSCodeNotify("workbench.action.navigateRight")<CR>') 
map('n', '<leader>', ':call VSCodeNotify("whichkey.show")<CR>') 
