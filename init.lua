vim.opt.nu = true

-- Tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spacesin tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python

--vim.opt.foldmethod = "indent"
--vim.opt.foldminlines = 0

require('core')
require('keymaps')
