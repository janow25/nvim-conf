local nomap = vim.keymap.del

vim.g.tmux_navigator_no_mappings = 1

-- nomap("n", "<C-h>")
-- nomap("n", "<C-j>")
-- nomap("n", "<C-k>")
-- nomap("n", "<C-l>")

local map = vim.keymap.set


-- Basic Mappings
map("n", "<leader>q", "<cmd> q <cr>", { desc = "Quit" })
map("n", "<leader>w", "<cmd> w <cr>", { desc = "Save" })
map("n", "<leader>W", "<cmd> wq <cr>", { desc = "Save & Quit" })

-- Mappings for NeoTree
map("", "<C-b>", "<Cmd>Neotree toggle<CR>", { desc = "Toggle NeoTree", silent = true })

-- Custom key mappings to close all buffers and open dashboard
map("n", "<leader>qa", function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    -- Skip modified buffers
    if vim.fn.getbufvar(buf, "&modified") == 0 then
      -- Only try to wipeout normal listed buffers
      local bt = vim.fn.getbufvar(buf, "&buftype")
      if bt == "" or bt == "acwrite" then
        vim.cmd("bwipeout " .. buf)
      end
    end
  end
  vim.cmd("Nvdash")
end, { desc = "Close all buffers" })

-- Custom key mappings for Tmux navigation
-- Works in both normal mode and terminal mode
local opts = { desc = "Tmux navigation", silent = true }

-- Left navigation
map({ "n", "t" }, "<C-h>", function()
  vim.cmd("silent! TmuxNavigateLeft")
end, opts)

-- Down navigation
map({ "n", "t" }, "<C-j>", function()
  vim.cmd("silent! TmuxNavigateDown")
end, opts)

-- Up navigation
map({ "n", "t" }, "<C-k>", function()
  vim.cmd("silent! TmuxNavigateUp")
end, opts)

-- Right navigation
map({ "n", "t" }, "<C-l>", function()
  vim.cmd("silent! TmuxNavigateRight")
end, opts)

-- Previous navigation
map({ "n", "t" }, "<C-p>", function()
  vim.cmd("silent! TmuxNavigatePrevious")
end, opts)

map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Move Line Up/Down
-- Normal mode: Move line up/down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })

-- Visual mode: Move selected lines up/down and reselect
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })


-- Terminal toggles using nvterm
map("n", "<A-h>", function()
  require("nvterm.terminal").toggle "horizontal"
end, { desc = "Toggle horizontal terminal" })

map("n", "<A-v>", function()
  require("nvterm.terminal").toggle "vertical"
end, { desc = "Toggle vertical terminal" })

map("n", "<A-i>", function()
  require("nvterm.terminal").toggle "float"
end, { desc = "Toggle floating terminal" })

-- Terminal toggles for MacOS right alt key
map("n", "ª", function()
  require("nvterm.terminal").toggle "horizontal"
end, { desc = "Toggle horizontal terminal" })

map("n", "√", function()
  require("nvterm.terminal").toggle "vertical"
end, { desc = "Toggle vertical terminal" })

map("n", "⁄", function()
  require("nvterm.terminal").toggle "float"
end, { desc = "Toggle floating terminal" })

local function close_if_float()
  local win = vim.api.nvim_get_current_win()
  local win_config = vim.api.nvim_win_get_config(win)

  if win_config.relative ~= "" then
    vim.api.nvim_win_close(win, true)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
  end
end

-- Terminal keymaps
map("t", "<Esc>", close_if_float, { desc = "Close floating terminal or exit terminal mode" })
map("t", "jk", close_if_float, { desc = "Close floating terminal or exit terminal mode" })

-- In terminal-normal mode, <Esc> closes the terminal window
map("n", "<Esc>", function()
  if vim.bo.buftype == "terminal" then
    vim.api.nvim_win_close(0, true)
  end
end, { desc = "Close terminal window" })

-- On Control + C in normal mode in terminal do insert and again control + c
map("n", "<C-c>", function()
  if vim.bo.buftype == "terminal" then
    vim.cmd "startinsert"
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, false, true), "n", true)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, false, true), "n", true)
  end
end, { desc = "Control + C in terminal" })

-- Fix broken <leader>v and <leader>h terminal mappings
map("n", "<leader>v", function()
  require("nvterm.terminal").toggle "vertical"
end, { desc = "Toggle vertical terminal" })

map("n", "<leader>h", function()
  require("nvterm.terminal").toggle "horizontal"
end, { desc = "Toggle horizontal terminal" })

-- Add Neogit mappings
map("n", "<leader>gg", function()
  require("neogit").open {}
end, { desc = "Open Neogit" })

map("n", "<leader>gc", function()
  require("neogit").open { "commit" }
end, { desc = "Open Neogit commit" })

map("n", "<leader>gP", function()
  require("neogit").open { "push" }
end, { desc = "Open Neogit push" })

map("n", "<leader>gp", function()
  require("neogit").open { "pull" }
end, { desc = "Open Neogit pull" })

map("n", "<leader>gf", function()
  require("neogit").open { "fetch" }
end, { desc = "Open Neogit fetch" })
