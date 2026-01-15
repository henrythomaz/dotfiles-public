return {
	-- ══════════════════════════════════════════════════════════
	-- Incremental Rename (já temos no coding.lua)
	-- ══════════════════════════════════════════════════════════
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		keys = {
			{
				"<leader>rn",
				function()
					return ":IncRename " .. vim.fn.expand("<cword>")
				end,
				desc = "Incremental rename",
				expr = true,
			},
		},
		config = true,
	},

	-- ══════════════════════════════════════════════════════════
	-- Refactoring.nvim - Refatorações automáticas
	-- ══════════════════════════════════════════════════════════
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{
				"<leader>re",
				function()
					require("refactoring").refactor("Extract Function")
				end,
				mode = "x",
				desc = "Extract Function",
			},
			{
				"<leader>rf",
				function()
					require("refactoring").refactor("Extract Function To File")
				end,
				mode = "x",
				desc = "Extract Function To File",
			},
			{
				"<leader>rv",
				function()
					require("refactoring").refactor("Extract Variable")
				end,
				mode = "x",
				desc = "Extract Variable",
			},
			{
				"<leader>ri",
				function()
					require("refactoring").refactor("Inline Variable")
				end,
				mode = { "n", "x" },
				desc = "Inline Variable",
			},
			{
				"<leader>rb",
				function()
					require("refactoring").refactor("Extract Block")
				end,
				mode = "n",
				desc = "Extract Block",
			},
			{
				"<leader>r",
				function()
					require("refactoring").select_refactor({
						show_success_message = true,
					})
				end,
				mode = "v",
				desc = "Refactoring menu",
			},
		},
		opts = {},
	},
}
