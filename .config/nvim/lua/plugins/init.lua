return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	{
		"folke/which-key.nvim",
		opts = {
			win = {
				border = "rounded",
			},
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"echasnovski/mini.icons",
		},
	},

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
			})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			exclude = { filetypes = { "dashboard" } },
		},
	},
}
