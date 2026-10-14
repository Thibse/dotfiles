return {
	{
		"lervag/vimtex",
		config = function()
			require("which-key").add({
				{ "<leader>l", group = "tex" },
				{ "<leader>la", desc = "Open Context Menu" },
				{ "<leader>lt", desc = "Open Table of Contents" },
				{
					"<leader>lz",
					function()
						local ok, pdf =
							pcall(vim.api.nvim_eval, "vimtex#context#get().handler.get_actions().entry.file")
						if not ok then
							vim.notify("No file found")
						end

						local cwd = vim.fn.getcwd()

						if vim.fn.isdirectory("annotations") == 0 then
							vim.fn.mkdir("annotations")
						end

						local md = vim.fn.printf("annotations/%s.md", vim.fn.fnamemodify(pdf, ":t:r"))
						vim.fn.system(vim.fn.printf('pdfannots -o "%s" "%s"', md, pdf))
						vim.cmd.split(vim.fn.fnameescape(md))

						vim.fn.chdir(cwd)
					end,
					desc = "Get annotations",
				},
			})
		end,
	},
}
