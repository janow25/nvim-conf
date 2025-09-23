return {
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		keys = {
			{ "<leader>ff", "<cmd> Telescope find_files <cr>", desc = "Find Files" },
			{ "<leader>fw", "<cmd> Telescope live_grep <cr>", desc = "Find Word" },
			{ "<leader>fb", "<cmd> Telescope buffers <cr>", desc = "Find Buffers" },
			{ "<leader>fh", "<cmd> Telescope help_tags <cr>", desc = "Find Help" },
			{ "<leader>fc", "<cmd> Telescope commands <cr>", desc = "Find Commands" },
			{ "<leader>fr", "<cmd> Telescope resume <cr>", desc = "Resume Last Search" },
			{ "<leader>fd", "<cmd> Telescope diagnostics <cr>", desc = "Find Diagnostics" },
			{ "<leader>fo", "<cmd> Telescope oldfiles <cr>", desc = "Find Old Files" },
			{ "<leader>fC", "<cmd> Telescope colorscheme <cr>", desc = "Find Colorscheme" },
			{ "<leader>fM", "<cmd> Telescope marks <cr>", desc = "Find Marks" },
      { "<leader>gb", "<cmd> Telescope git_branches <cr>", desc = "Git Branches" },
    },
		dependencies = { 'nvim-lua/plenary.nvim' }
	}
}
