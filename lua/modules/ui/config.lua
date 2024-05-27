local config = {}

function config.catppuccin()
   require('catppuccin').setup({
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
   })

   vim.cmd.colorscheme "catppuccin"
end

function config.lualine()
   require('lualine').setup({
      options = {
         icons_enabled = true,
         theme = 'auto',
         component_separators = { left = '', right = ''},
         section_separators = { left = '', right = ''},
         disabled_filetypes = {
            statusline = {},
            winbar = {},
         },
         ignore_focus = {},
         always_divide_middle = true,
         globalstatus = false,
         refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
         }
      },
      sections = {
         lualine_a = {'mode'},
         lualine_b = {'branch', 'diff', 'diagnostics'},
         lualine_c = {'filename'},
         lualine_x = {'encoding', 'fileformat', 'filetype'},
         lualine_y = {'progress'},
         lualine_z = {'location'}
      },
      inactive_sections = {
         lualine_a = {},
         lualine_b = {},
         lualine_c = {'filename'},
         lualine_x = {'location'},
         lualine_y = {},
         lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
   })
end

function config.bufferline()
   require("cokeline").setup()
end

function config.nvimtree()
   require("nvim-tree").setup{}
end

function config.ibl()
   require("ibl").setup({
      
   })
end

return config
