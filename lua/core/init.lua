require('core.pack'):bootstrap()
--require("keymaps")

--[[local plugins = {
   { "catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- Color scheme "Catpuccin"

   -- LSP configuration
   { "williamboman/mason.nvim" },
   { "williamboman/mason-lspconfig.nvim"},
   { "neovim/nvim-lspconfig" },

   -- Auto completion configuration
   { "hrsh7th/cmp-nvim-lsp" },
   { "hrsh7th/cmp-buffer" },
   { "hrsh7th/cmp-path" },
   { "hrsh7th/cmp-cmdline" },
   { "hrsh7th/nvim-cmp" },

   --snippets
   { "hrsh7th/cmp-vsnip" },
   { "hrsh7th/vim-vsnip" },

   --Dart and flutter plugins
   {
      'akinsho/flutter-tools.nvim',
      lazy = false,
      dependencies = {
         'nvim-lua/plenary.nvim',
         'stevearc/dressing.nvim', -- optional for vim.ui.select
      },
      config = true,
   },

   -- Lua Line
   { "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons" },

   -- Bufferline
   { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

   -- file explorer
   { "nvim-tree/nvim-tree.lua", lazy = true, dependencies = 'nvim-tree/nvim-web-devicons'},

   -- tree sitter
   { "nvim-treesitter/nvim-treesitter" },
}
local opts = {}

require("lazy").setup(plugins, opts)]]

--[[require("plugins/color_scheme")
require("plugins/lsp")
require("plugins/nvim-lines")
require("plugins/autocompletion")
require("nvim-tree").setup{}
require("flutter-tools").setup {
   widget_guides = {
    enabled = true,
  },
}
require("nvim-treesitter").setup {
   ensure_installed = { "lua", "dart" },
   sync_install = false,
   auto_install = true,
   --indent = {
      --enable = true,
   --},
}]]
