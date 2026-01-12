return {
	"nvim-neo-tree/neo-tree.nvim",
	-- 🚫 Desabilitar lazy loading para ter controle total
	lazy = true,
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
		{ "<leader>fe", "<cmd>Neotree reveal<cr>", desc = "Reveal in Neo-tree" },
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
