local package = require("core.pack").package
local config = require("modules.lsp.config")

-- Mason for lsp package manager
package({ 
   "williamboman/mason.nvim",
   dependencies = "williamboman/mason-lspconfig.nvim",
   config = config.mason,
})

-- Lsp and autocompletion
package({
   "hrsh7th/nvim-cmp",
   dependencies = {
      "hrsh7th/vim-vsnip",
      --"hrsh7th/vim-vsnip-integ",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "neovim/nvim-lspconfig"
   },
   config = config.cmp,
})
