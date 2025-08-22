return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
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

			local function _lazygit_toggle()
				lazygit:toggle()
			end

			local vTerm = Terminal:new {
				cmd = "zsh",
				direction = "vertical",
			}

			local function _vterm_toggle()
				vTerm:toggle()
			end

			local hTerm = Terminal:new {
				cmd = "zsh",
				direction = "horizontal",
			}

			local function _hterm_toggle()
				hTerm:toggle()
			end

			local fTerm = Terminal:new {
				cmd = "zsh",
				direction = "float",
			}

			local function _fterm_toggle()
				fTerm:toggle()
			end

			vim.keymap.set("n", "<leader>v", _vterm_toggle, { desc = "Toggle Vertical Terminal" })
			vim.keymap.set("n", "<leader>h", _hterm_toggle, { desc = "Toggle Horizontal Terminal" })

			vim.keymap.set("n", "<leader>g", _lazygit_toggle, { desc = "Toggle Lazygit" })
			vim.keymap.set("n", "<M-g>", _lazygit_toggle, { desc = "Toggle Lazygit" })
			vim.keymap.set("n", "<M-i>", _fterm_toggle, { desc = "Toggle Floating Terminal" })
		end,
	},
}
