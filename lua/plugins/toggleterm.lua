return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
    },
    keys = {
      { "<leader>g", desc = "Toggle Lazygit" },
      { "<M-g>", desc = "Toggle Lazygit" },
			{ "<M-i>", desc = "Toggle Floating Terminal" },
      { "<leader>h", desc = "Toggle Horizontal Terminal" },
      { "<leader>v", desc = "Toggle Vertical Terminal" },
    },
    config = function()
			require("toggleterm").setup {
			}
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new { cmd = "lazygit", hidden = true, direction = "float" }

      function _lazygit_toggle()
        lazygit:toggle()
      end

      vim.keymap.set("n", "<leader>g", _lazygit_toggle, { desc = "Toggle Lazygit" })
      vim.keymap.set("n", "<M-g>", _lazygit_toggle, { desc = "Toggle Lazygit" })
      vim.keymap.set("n", "<M-i>", "<cmd>ToggleTerm direction=float name=Shell<CR>", { desc = "Toggle Floating Terminal" })
      vim.keymap.set("n", "<leader>h", "<cmd>ToggleTerm direction=horizontal name=hShell<CR>", { desc = "Toggle Horizontal Terminal" })
			vim.keymap.set("n", "<leader>v", "<cmd>ToggleTerm direction=vertical name=vShell<CR>", { desc = "Toggle Vertical Terminal" })
    end,
  },
}
