local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

local function load_plugins()
  local plugins = {}
  local function load_from_directory(directory, prefix)
    local files = vim.fn.glob(directory .. "*.lua", true, true)
    for _, file in ipairs(files) do
      local module_name = prefix .. "." .. vim.fn.fnamemodify(file, ":t:r")
      table.insert(plugins, require(module_name))
    end
  end

  load_from_directory(vim.fn.stdpath("config") .. "/lua/configs/", "configs")
  load_from_directory(vim.fn.stdpath("config") .. "/lua/plugins/", "plugins")

  return plugins
end

require('lazy').setup(load_plugins())

