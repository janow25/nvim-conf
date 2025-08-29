vim.g.mapleader = " "

if not vim.g.vscode then
  -- bootstrap lazy and all plugins
  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

  if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
  end

  vim.opt.rtp:prepend(lazypath)

  local lazy_config = require "configs.lazy"

  -- load plugins
  require("lazy").setup({
    { import = "plugins" },
  }, lazy_config)
end

require "options"
require "autocmds"

vim.schedule(function()
  if vim.g.vscode then
    require "mappings-vscode"
  else
    vim.cmd.colorscheme "catppuccin"
    require "mappings"
  end
end)
