return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		config = function(_, opts)
			require("bufferline").setup{}
			-- Fix bufferline when restoring a session
			vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
				callback = function()
					vim.schedule(function()
						pcall(nvim_bufferline)
					end)
				end,
			})
		end,
	}
}
