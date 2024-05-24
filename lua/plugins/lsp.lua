require("mason").setup()
require("mason-lspconfig").setup({
   ensure_installed = { "lua_ls" }
})

local on_attach = function(_,_)
   vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
   vim.keymap.set('n', 'gD', vim.lsp.buf.definition, {})
   vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'lspconfig'.lua_ls.setup {
   on_init = function(client)
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
         return
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
         runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
         },
         -- Make the server aware of Neovim runtime files
         workspace = {
            checkThirdParty = false,
            library = {
               vim.env.VIMRUNTIME
               -- Depending on the usage, you might want to add additional paths here.
               -- "${3rd}/luv/library"
               -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
         }
      })
   end,
   settings = {
      Lua = {}
   },

   on_attach = on_attach,
   capabilities = capabilities

}

require'lspconfig'.dartls.setup {
   on_attach = on_attach,
   capabilities = capabilities
}


