return {
	-- ══════════════════════════════════════════════════════════
	-- Kulala - HTTP Client (alternativa ao rest.nvim)
	-- ══════════════════════════════════════════════════════════
	{
		"mistweaverco/kulala.nvim",
		ft = "http",
		keys = {
			{ "\\r", "<cmd>lua require('kulala').run()<cr>", desc = "Run HTTP request", ft = "http" },
			{ "\\p", "<cmd>lua require('kulala').replay()<cr>", desc = "Replay last request", ft = "http" },
			{ "\\i", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect request", ft = "http" },
			{ "\\c", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy as cURL", ft = "http" },
		},
		config = function()
			require("kulala").setup({
				default_view = "body",
				default_env = "dev",
				debug = false,
			})
		end,
	},
}
