local package = require('core.pack').package
local config = require('modules.ui.config')

   -- Colorsheme
package({ "catppuccin/nvim", 
   name = "catppuccin", 
   priority = 1000,
   config = config.catppuccin}) -- Color scheme "Catpuccin"


   -- Lua Line
package({ "nvim-lualine/lualine.nvim", 
   dependencies = "nvim-tree/nvim-web-devicons",
   config = config.lualine})

   -- Bufferline
package({ 'akinsho/bufferline.nvim', 
   tag = 'v4.5.3',

   dependencies = 'nvim-tree/nvim-web-devicons',
   config = config.bufferline})

   -- file explorer
package({ "nvim-tree/nvim-tree.lua", 
   lazy = true, 
   dependencies = 'nvim-tree/nvim-web-devicons'})
