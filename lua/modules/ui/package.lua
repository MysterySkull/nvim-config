local package = require('core.pack').package
local config = require('modules.ui.config')

-- Colorsheme
package({ "catppuccin/nvim", 
   name = "catppuccin", 
   priority = 1000,
   config = config.catppuccin
}) 


-- Lua Line
package({ "nvim-lualine/lualine.nvim", 
   dependencies = "nvim-tree/nvim-web-devicons",
   config = config.lualine
})

-- Bufferline
--[[package({ 'akinsho/bufferline.nvim', 
   version = "*",
   commit = "73540cb95f8d95aa1af3ed57713c6720c78af915",
   dependencies = 'nvim-tree/nvim-web-devicons',
   config = config.bufferline})]]

-- BufferLine that i Hope will work
package({  "willothy/nvim-cokeline",
   dependencies = {
      "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
      "nvim-tree/nvim-web-devicons", -- If you want devicons
      "stevearc/resession.nvim"       -- Optional, for persistent history
   },
   config = config.bufferline
})

-- file explorer
package({ "nvim-tree/nvim-tree.lua", 
   lazy = true, 
   dependencies = 'nvim-tree/nvim-web-devicons',
   config = config.nvimtree
})

--Blank Line for indentation
package({ "lukas-reineke/indent-blankline.nvim", 
   config = config.ibl
})
