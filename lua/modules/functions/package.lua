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
package({ "hrsh7th/nvim-cmp",
   config = config.cmp,
})

