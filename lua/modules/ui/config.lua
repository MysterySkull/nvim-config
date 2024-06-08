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
   require("nvim-tree").setup{}

   -- help for quit with last buffer when nvim-tree is open
   -- this means that when last buffer is closed via ":q" or ":bd"
   -- if nvim-tree is open, nvim closes
   vim.api.nvim_create_autocmd({'BufEnter', 'QuitPre'}, {
      nested = false,
      callback = function(e)
         local tree = require('nvim-tree.api').tree

         -- Nothing to do if tree is not opened
         --[[if not tree.is_visible() then
         return
      end]]

      -- How many windows do we have? (excluding floats e.g. from incline)
      local winCount = 0
      for _,winId in ipairs(vim.api.nvim_list_wins()) do
         if vim.api.nvim_win_get_config(winId).relative == '' then
            winCount = winCount + 1
         end
      end

      -- We want to quit and only one window besides tree is left
      if e.event == 'QuitPre' and winCount == 2 then
         vim.api.nvim_cmd({cmd = 'qall'}, {})
      end

      -- :bd was probably issued an only tree window is left
      -- Behave as if tree was closed (see `:h :bd`)
      if e.event == 'BufEnter' and winCount == 1 then
         -- Required to avoid "Vim:E444: Cannot close last window"
         vim.defer_fn(function()
            -- close nvim-tree: will go to the last buffer used before closing
               tree.toggle({find_file = true, focus = true})
            -- re-open nivm-tree
               tree.toggle({find_file = true, focus = false})
            end, 10)
         end
      end
   })
end

function config.ibl()
   require("ibl").setup{
      scope = { enabled = false, }
   }
end

return config
