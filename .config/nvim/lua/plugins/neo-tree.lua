return {
	"nvim-neo-tree/neo-tree.nvim",
	-- Remover o lazy = true para carregar automaticamente
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
		{ "<leader>E", "<cmd>Neotree reveal<cr>", desc = "Reveal in Neo-tree" },
	},
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			enable_simple_view = true,
			window = {
				position = "left",
				width = 30,
			},
		},
		sources = { "filesystem" },
	},
}
