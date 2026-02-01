return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      { "<C-n>", "<cmd>lua Snacks.explorer()<cr>", desc = "Toggle Explorer" },
      { "<C-b>", "<cmd>lua Snacks.explorer()<cr>", desc = "Toggle Explorer" },
      { "<M-g>", "<cmd>lua Snacks.lazygit()<cr>", desc = "Open Lazygit" },
      { "<leader>g", "<cmd>lua Snacks.lazygit()<cr>", desc = "Open Lazygit" },
      {
        "<leader>e",
        function()
          local snacks = Snacks.picker.get({source = "explorer"})[1]
          if snacks then
            snacks.input.win:focus()
          else
            Snacks.explorer({ focus = "input" })
          end
        end,
        desc = "Focus Explorer",
      },
    },
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          {
            section = "terminal",
            cmd = require("utils.ascii_helper").get_ascii_image_str(),
            height = 30,
            width = 60,
            padding = 4,
          },
          { section = "keys",   gap = 1, padding = 2 },
          { section = "startup" },
        }
      },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  }
}
