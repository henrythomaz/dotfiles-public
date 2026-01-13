-- lua/plugins/blink.lua
return {
	"saghen/blink.cmp",
	opts = function(_, opts)
		-- exemplo: não abrir auto, só com <C-Space>
		opts.completion = opts.completion or {}
		opts.completion.menu = opts.completion.menu or {}
		opts.completion.menu.auto_show = false

		-- mapeamento extra se quiser
		opts.keymap = vim.tbl_extend("force", opts.keymap or {}, {
			["<C-Space>"] = { "show", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		})

		return opts
	end,
}
