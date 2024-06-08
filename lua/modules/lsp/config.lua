local config = {}

function config.mason()
  require('mason').setup{}
end

function config.cmp()
   local cmp = require'cmp'

   cmp.setup({
      snippet = {
         -- REQUIRED - you must specify a snippet engine
         expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
         end,
      },
      window = {
         -- completion = cmp.config.window.bordered(),
         -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
         ['<C-f>'] = cmp.mapping.scroll_docs(4),
         ['<C-Space>'] = cmp.mapping.complete(),
         ['<C-e>'] = cmp.mapping.abort(),
         ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
         { name = 'nvim_lsp' },
         { name = 'vsnip' },

      }, {
         { name = 'buffer' },
      })
   })

   -- Set up lspconfig.
   local capabilities = vim.lsp.protocol.make_client_capabilities()
   local capabilities = require('cmp_nvim_lsp').default_capabilities()
   capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
   }

   require'lspconfig'.lua_ls.setup({
      capabilities = capabilities
   })
end

return config
