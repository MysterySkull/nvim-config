local package = require("core.pack").package
local config = require("modules.functions.config")

-- Main page

-- Tree SItter
package({ "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   config = config.treesitter,
})

-- Fold Enhancer
package({ "kevinhwang91/nvim-ufo",
   dependencies = 'kevinhwang91/promise-async',
   config = config.ufo,
})

-- Autocompletion/snippets/and stuff
package({
   "hrsh7th/nvim-cmp",
   dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline"
   },
   config = config.cmp,
})

