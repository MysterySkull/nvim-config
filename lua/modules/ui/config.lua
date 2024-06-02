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
   local get_hex = require('cokeline.hlgroups').get_hl_attr

   --get color from color scheme
   local color = require("catppuccin.palettes").get_palette "macchiato"

   local bg_buff_line_color = color.crust
   local bg_unselected_buff_color = color.mantle
   local bg_selected_buff_color = color.base
   local bg_file_explorer_color = color.mantle

   local fg_file_explorer_color = color.peach
   
   local fg_buffer_selected_modified = color.green
   local fg_buffer_unselected_modified = color.text

   vim.api.nvim_set_hl(0, "TabLine", { bg = bg_buff_line_color})

   require("cokeline").setup{
      fill_hl = 'TabLine',

      default_hl = {
         fg = function(buffer)
            return
            buffer.is_focused
            and get_hex('Normal', 'fg')
            or get_hex('Comment', 'fg')
         end,
         bg = function(buffer)
            if buffer.filetype == "NvimTree" then return bg_file_explorer_color
            elseif buffer.is_focused then return bg_selected_buff_color
            elseif buffer.is_focused == false then return bg_unselected_buff_color
            else return bg_buff_line_color
            end
         end,
      },

      sidebar = {
         filetype = {'NvimTree', 'neo-tree'},
         components = {
            {
               text = function(buffer)
                  return " File Explorer"
               end,
               fg = fg_file_explorer_color,
               bold = true,
            },
         }
      },

      components = {
         {
            text = '  ',
            fg = bg_buff_line_color,
         },
         {
            text = function(buffer)
               return buffer.devicon.icon
            end,
            fg = function(buffer)
               return buffer.devicon.color
            end,
         },
         {
            text = ' ',
         },
         {
            text = function(buffer) return buffer.filename .. '  ' end,
            bold = function(buffer)
               return buffer.is_focused
            end,
         },
         {
            text = function(buffer) return buffer.is_modified and '' or '' end,
            fg = function(buffer) return buffer.is_focused and fg_buffer_selected_modified or fg_buffer_unselected_modified end,
         },
         {
            text = ' ',
         },
         {
            text = '',
            on_click = function(_, _, _, _, buffer)
               buffer:delete()
            end,
         },
                  {
            text = '  ',
            fg = bg_buff_line_color,
         },
      },
   }
end

function config.nvimtree()
   require("nvim-tree").setup{

   }
end

function config.ibl()
   require("ibl").setup{
     scope = { enabled = false, }
   }
end

return config
