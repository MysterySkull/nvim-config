local package = require('core.pack').package
local config = require('modules.ui.config')

package({ "catppuccin/nvim", 
   name = "catppuccin", 
   priority = 1000,
   config = config.catppuccin}) -- Color scheme "Catpuccin"
