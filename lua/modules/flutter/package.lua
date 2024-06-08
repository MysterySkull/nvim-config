local package = require("core.pack").package
local config = require("modules.flutter.config")


package({ "akinsho/flutter-tools.nvim",
   lazy = false,
   dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
   config = config.flutter
})


