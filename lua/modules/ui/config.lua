local config = {}

function config.catppuccin()
   require('catppuccin').setup({
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
   })

   vim.cmd.colorscheme "catppuccin"
end

return config
