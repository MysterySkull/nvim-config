local package = require("core.pack").package
local config = require("modules.functions.config")

-- Main page



-- Fold Enhancer
package({ "kevinhwang91/nvim-ufo",
   dependencies = 'kevinhwang91/promise-async',
   config = config.ufo,
})
