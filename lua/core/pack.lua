local pack = {}
pack.__index = pack

function pack:bootstrap()

   self.repos = {}
   local opts = {}

   config_path = '/home/guillaume/.config/nvim'
   modules_path = table.concat({ config_path, 'lua', 'modules' }, '/')

   -- List all packages to add, and load them
   local list = vim.fs.find('package.lua', { path = modules_path , type = file, limit = 10})
   if #list == 0 then
      return
   end

   for _, f in pairs(list) do
      local _, pos = string.find(f, modules_path)
      f = string.sub(f, pos - 6, #f - 4)
      require(f)
   end

   -- Load lazyvim in case it is not done
   local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
   if not (vim.uv or vim.loop).fs_stat(lazypath) then
      vim.fn.system({
         "git",
         "clone",
         "--filter=blob:none",
         "https://github.com/folke/lazy.nvim.git",
         "--branch=stable", -- latest stable release
         lazypath,
      })
   end
   vim.opt.rtp:prepend(lazypath)

   local lazy = require('lazy')
   
   -- Set lazy up according to all config done in correspounding packages files
   lazy.setup(self.repos, opts)

end

-- Utils fonction to add Lazy config
function pack.package(repo)
   if not pack.repos then
      pack.repos = {}
   end
   table.insert(pack.repos, repo)
end

return pack
