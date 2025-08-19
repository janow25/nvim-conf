return {
	"akinsho/bufferline.nvim",
	version = "*",
	lazy = false,
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				mode = "buffers",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Tree",
						separator = false,
						text_align = "left",
					},
					{
						filetype = "TelescopePrompt",
						text = "Telescope",
						separator = false,
						text_align = "left",
					},
				},
				diagnostics = "nvim_lsp",
				separator_style = { "", "" },
				modified_icon = "●",
				show_close_icon = false,
				show_buffer_close_icons = true,
			},
		})
	end,
}
