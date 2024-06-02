local package = require("core.pack").package
local config = require("modules.lsp.config")

-- Mason for lsp package manager
package({ 
   "williamboman/mason.nvim",
   dependencies = "williamboman/mason-lspconfig.nvim",
   config = config.mason,
})


-- Nvim LSP configs
package({ "neovim/nvim-lspconfig",
   config = config.lsp,
})
