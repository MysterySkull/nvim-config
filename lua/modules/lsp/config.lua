local config = {}

function config.mason()
  require('mason').setup{} 
end

function config.lsp()



  --require'lspconfig'.lua_ls.setup{} 

end 

return config
