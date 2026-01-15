return {
	{
		"github/copilot.vim",
		event = "InsertEnter",
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_tab_fallback = ""

			-- Aceitar sugestão com Ctrl+J
			vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
				expr = true,
				replace_keycodes = false,
				silent = true,
			})

			-- Navegação de sugestões
			vim.keymap.set("i", "<C-H>", "<Plug>(copilot-previous)", { silent = true })
			vim.keymap.set("i", "<C-L>", "<Plug>(copilot-next)", { silent = true })
			vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-suggest)", { silent = true })
		end,
	},
}
