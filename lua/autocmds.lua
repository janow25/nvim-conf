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
