return {
	{
		"NvChad/nvterm",
		keys = {
			{ "<A-h>", function() require("nvterm.terminal").toggle "horizontal" end, desc = "Toggle horizontal terminal" },
			{ "<A-v>", function() require("nvterm.terminal").toggle "vertical" end, desc = "Toggle vertical terminal" },
			{ "<A-i>", function() require("nvterm.terminal").toggle "float"     end, desc = "Toggle floating terminal" },

			-- MacOS right alt key mappings
			{ "ª", function() require("nvterm.terminal").toggle "horizontal" end, desc = "Toggle horizontal terminal" },
			{ "√", function() require("nvterm.terminal").toggle "vertical"   end, desc = "Toggle vertical terminal" },
			{ "⁄", function() require("nvterm.terminal").toggle "float"      end, desc = "Toggle floating terminal" },
		},
		config = function()
			require("nvterm").setup()
		end,
	},
}
