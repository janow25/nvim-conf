vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.spell = true
  end,
})

-- Automatically enter insert mode for ToggleTerm buffers when focusing split
vim.api.nvim_create_augroup("insertonenter", { clear = true })

local function insert_on_terminal()
  local bufname = vim.api.nvim_buf_get_name(0)
  if vim.bo.buftype == "terminal" and bufname:match("toggleterm") then
    vim.defer_fn(function()
      vim.cmd("startinsert")
    end, 20)
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
