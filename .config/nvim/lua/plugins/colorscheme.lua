return {
	-- ══════════════════════════════════════════════════════════
	-- Sonokai - Seu colorscheme preferido!
	-- ══════════════════════════════════════════════════════════
	{
		"sainnhe/sonokai",
		priority = 1000,
		config = function()
			-- Configurações do Sonokai
			vim.g.sonokai_transparent_background = "1"
			vim.g.sonokai_enable_italic = "1"
			vim.g.sonokai_style = "andromeda" -- Opções: default, atlantis, andromeda, shusia, maia, espresso
			vim.g.sonokai_better_performance = 1
			vim.g.sonokai_diagnostic_text_highlight = 1
			vim.g.sonokai_diagnostic_line_highlight = 1

			vim.cmd.colorscheme("sonokai")
		end,
	},

	-- Configure LazyVim para usar Sonokai
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "sonokai",
		},
	},
}
