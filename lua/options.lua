local opt = vim.opt

opt.showmode = false

opt.winborder = "rounded"
opt.hlsearch = false
opt.tabstop = 2
opt.cursorcolumn = false
opt.ignorecase = true
opt.shiftwidth = 2
opt.smartindent = true
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.undofile = true
opt.signcolumn = "yes"

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- fix No Name buffer
-- by janow
opt.hidden = false

opt.spelllang = "en,de"

vim.diagnostic.config({
  virtual_text = true,   -- show inline text
  signs = false,          -- show signs in the gutter
  underline = true,      -- underline problematic text
  update_in_insert = true, -- update diagnostics in insert mode
})
