local config = {}

function config.ufo()
   local ufo = require("ufo")

   vim.o.foldcolumn = '1' -- '0' is not bad
   vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
   vim.o.foldlevelstart = 99
   vim.o.foldenable = true

   -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
   vim.keymap.set('n', 'zR', ufo.openAllFolds)
   vim.keymap.set('n', 'zM', ufo.closeAllFolds)
   vim.keymap.set('n', 'zz', ufo.peekFoldedLinesUnderCursor)

   ufo.setup{}
end


function config.treesitter()
   require("nvim-treesitter").setup{
      ensure_insalled = { "lua",},
      sync_insall = true,
      highlight = { enable = true },
      indent = { enable = true },
   }
end

return config
