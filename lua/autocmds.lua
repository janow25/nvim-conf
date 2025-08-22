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

-- Automatically enter insert mode for ToggleTerm buffers when focusing split
vim.api.nvim_create_augroup("insertonenter", { clear = true })

local function insert_on_terminal()
  if vim.bo.buftype == "terminal" then
    vim.defer_fn(function()
      vim.cmd("startinsert")
    end, 20) -- delay in milliseconds
  end
end

-- Enter insert mode when entering any buffer that is a terminal (includes ToggleTerm)
vim.api.nvim_create_autocmd("BufEnter", {
  group = "insertonenter",
  pattern = "*",
  callback = insert_on_terminal,
})

-- Also enter insert mode when a terminal is opened (creation event)
vim.api.nvim_create_autocmd("TermOpen", {
  group = "insertonenter",
  pattern = "*",
  callback = insert_on_terminal,
})
