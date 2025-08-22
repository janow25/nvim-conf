return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = {
		},
		keys = {
			{ "<leader>g", desc = "Toggle Lazygit" },
			{ "<M-g>",     desc = "Toggle Lazygit" },
			{ "<M-i>",     desc = "Toggle Floating Terminal" },
			{ "<leader>h", desc = "Toggle Horizontal Terminal" },
			{ "<leader>v", desc = "Toggle Vertical Terminal" },
		},
		config = function()
			require("toggleterm").setup {
				size = function(term)
					if term.direction == "vertical" then
						return vim.o.columns * 0.4
					elseif term.direction == "horizontal" then
						return vim.o.lines * 0.4
					end
				end,
			}
			local Terminal = require('toggleterm.terminal').Terminal
			local lazygit = Terminal:new { cmd = "lazygit", hidden = true, direction = "float", display_name = " LazyGit ", float_opts = {
				border = "single",
			}, }

			function _lazygit_toggle()
				lazygit:toggle()
			end

			vim.keymap.set("n", "<leader>g", _lazygit_toggle, { desc = "Toggle Lazygit" })
			vim.keymap.set("n", "<M-g>", _lazygit_toggle, { desc = "Toggle Lazygit" })
			vim.keymap.set("n", "<M-i>", "<cmd>ToggleTerm direction=float name=Shell<CR>",
				{ desc = "Toggle Floating Terminal" })
			vim.keymap.set("n", "<leader>h", "<cmd>ToggleTerm direction=horizontal name=hShell<CR>",
				{ desc = "Toggle Horizontal Terminal" })
			vim.keymap.set("n", "<leader>v", "<cmd>ToggleTerm direction=vertical name=vShell size=50%<CR>",
				{ desc = "Toggle Vertical Terminal" })
		end,
	},
}
