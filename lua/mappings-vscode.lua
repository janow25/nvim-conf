-- VSCode Neovim key mappings using VSCodeCall
-- Replace your mappings with these to trigger native VSCode actions

local map = vim.keymap.set

-- Basic Mappings
map("n", "<leader>q", function() vim.fn.VSCodeCall("workbench.action.closeActiveEditor") end, { desc = "Quit" })
map("n", "<leader>w", function() vim.fn.VSCodeCall("workbench.action.files.save") end, { desc = "Save" })
map({ "n", "i", "v" }, "<C-s>", function() vim.fn.VSCodeCall("workbench.action.files.save") end, { desc = "Save" })
map("n", "<leader>W", function()
  vim.fn.VSCodeCall("workbench.action.files.saveAll")
  vim.fn.VSCodeCall("workbench.action.closeAllEditors")
end, { desc = "Save & Quit" })
map("n", "<A-g>", function() vim.fn.VSCodeCall("lazygit.openLazygit") end, { desc = "Open Lazygit" })

-- Git Branch Selection
map("n", "<leader>gb", function() vim.fn.VSCodeCall("git.checkout") end, { desc = "Git Branches" })

-- Terminal Mappigns
map("n", "<leader>h", function() vim.fn.VSCodeCall("terminal.focus") end, { desc = "Focus Terminal" })

-- LSP Mappings
map("n", "<leader>lr", function() vim.fn.VSCodeCall("editor.action.rename") end, { desc = "Rename" })
map("n", "<leader>ld", function() vim.fn.VSCodeCall("editor.action.revealDefinition") end, { desc = "Go to Definition" })
map("n", "<leader>li", function() vim.fn.VSCodeCall("editor.action.goToImplementation") end,
  { desc = "Go to Implementation" })
map("n", "<leader>lD", function() vim.fn.VSCodeCall("editor.action.revealDeclaration") end,
  { desc = "Go to Declaration" })
map("n", "<leader>lT", function() vim.fn.VSCodeCall("editor.action.goToTypeDefinition") end,
  { desc = "Go to Type Definition" })
map("n", "<leader>ls", function() vim.fn.VSCodeCall("editor.action.triggerParameterHints") end,
  { desc = "Signature Help" })
map("n", "<leader>lS", function() vim.fn.VSCodeCall("workbench.action.showAllSymbols") end, { desc = "Document Symbols" })
map("n", "<leader>lR", function() vim.fn.VSCodeCall("editor.action.referenceSearch.trigger") end, { desc = "References" })
map("n", "<leader>lA", function() vim.fn.VSCodeCall("editor.action.quickFix") end, { desc = "Code Action" })
map("n", "<leader>lH", function() vim.fn.VSCodeCall("editor.action.showHover") end, { desc = "Hover" })
map("n", "<leader>lK", function() vim.fn.VSCodeCall("editor.action.triggerParameterHints") end,
  { desc = "Signature Help" })

-- Formatting
map("n", "<leader>fm", function() vim.fn.VSCodeCall("editor.action.formatDocument") end, { desc = "Format" })

-- Comment Toggle
map("n", "<leader>/", function() vim.fn.VSCodeCall("editor.action.commentLine") end, { desc = "Toggle comment" })
map("v", "<leader>/", function() vim.fn.VSCodeCall("editor.action.blockComment") end, { desc = "Toggle block comment" })

-- File Explorer
map("", "<C-b>", function() vim.fn.VSCodeCall("workbench.action.toggleSidebarVisibility") end,
  { desc = "Toggle Sidebar", silent = true })
map("n", "<leader>e", function() vim.fn.VSCodeCall("workbench.view.explorer") end,
  { desc = "Focus Explorer", silent = true })

-- Buffer Navigation
-- map("n", "<Tab>", function() vim.fn.VSCodeCall("workbench.action.nextEditor") end, { desc = "Next Buffer", silent = true })
-- map("n", "<S-Tab>", function() vim.fn.VSCodeCall("workbench.action.previousEditor") end, { desc = "Previous Buffer", silent = true })

-- Close all buffers & open welcome page
map("n", "<leader>qa", function()
  vim.fn.VSCodeCall("workbench.action.closeAllEditors")
end, { desc = "Close all editors and open Welcome" })

-- Window Navigation
map({ "n", "t" }, "<C-h>", function() vim.fn.VSCodeCall("workbench.action.navigateLeft") end,
  { desc = "Navigate Left", silent = true })
map({ "n", "t" }, "<C-j>", function() vim.fn.VSCodeCall("workbench.action.navigateDown") end,
  { desc = "Navigate Down", silent = true })
map({ "n", "t" }, "<C-k>", function() vim.fn.VSCodeCall("workbench.action.navigateUp") end,
  { desc = "Navigate Up", silent = true })
map({ "n", "t" }, "<C-l>", function() vim.fn.VSCodeCall("workbench.action.navigateRight") end,
  { desc = "Navigate Right", silent = true })
map({ "n", "t" }, "<C-p>", function() vim.fn.VSCodeCall("workbench.action.quickOpenPreviousRecentlyUsedEditor") end,
  { desc = "Previous Editor", silent = true })

-- Move lines up/down
map("n", "<A-Down>", function() vim.fn.VSCodeCall("editor.action.moveLinesDownAction") end, { desc = "Move line down" })
map("n", "<A-Up>", function() vim.fn.VSCodeCall("editor.action.moveLinesUpAction") end, { desc = "Move line up" })

-- Telescope-like mappings
map("n", "<leader>ff", function() vim.fn.VSCodeCall("workbench.action.quickOpen") end, { desc = "Find Files" })
map("n", "<leader>fw", function() vim.fn.VSCodeCall("workbench.action.findInFiles") end, { desc = "Find Word" })
map("n", "<leader>fb", function() vim.fn.VSCodeCall("workbench.action.showAllEditors") end, { desc = "Find Buffers" })
map("n", "<leader>fh", function() vim.fn.VSCodeCall("workbench.action.openDocumentationUrl") end, { desc = "Find Help" })
map("n", "<leader>fc", function() vim.fn.VSCodeCall("workbench.action.showCommands") end, { desc = "Find Commands" })
map("n", "<leader>fr", function() vim.fn.VSCodeCall("workbench.action.quickOpenPreviousEditor") end,
  { desc = "Resume Last Search" })
map("n", "<leader>fd", function() vim.fn.VSCodeCall("workbench.actions.view.problems") end, { desc = "Find Diagnostics" })
map("n", "<leader>fo", function() vim.fn.VSCodeCall("workbench.action.openRecent") end, { desc = "Find Old Files" })
map("n", "<leader>fC", function() vim.fn.VSCodeCall("workbench.action.selectTheme") end, { desc = "Find Colorscheme" })
map("n", "<leader>fM", function() vim.fn.VSCodeCall("workbench.action.showAllSymbols") end,
  { desc = "Find Marks/Symbols" })
