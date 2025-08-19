vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.spell = true
  end,
})

-- Close Neo-tree on quit
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    -- Try to close Neo-tree if open
    vim.cmd("Neotree close")
  end,
})

-- Redraw Alpha dashboard on startup
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    local stats = require("lazy").stats()
    local dashboard = require("alpha.themes.dashboard")
    local version = vim.version()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    dashboard.section.footer.val =
      os.date("  %m-%d-%Y   %H:%M:%S") ..
      "   Plugins " .. stats.loaded .. "/" .. stats.count ..
      "   v" .. version.major .. "." .. version.minor .. "." .. version.patch ..
      "   " .. ms .. "ms"
    require("alpha").redraw()
  end,
})
