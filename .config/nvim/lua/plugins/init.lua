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
		"christoomey/vim-tmux-navigator",
		lazy = false,
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
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			exclude = { filetypes = { "dashboard" } },
		},
	},

	'tpope/vim-fugitive',
	'tpope/vim-sleuth'
}
