-- lua/config/diagnostics.lua
vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- símbolo do inline
	},
	underline = true,
	signs = true,
})

-- exemplo de deixar linha inteira com background quando tiver erro
vim.cmd([[
  highlight DiagnosticLineError guibg=#51202a
  highlight DiagnosticLineWarn  guibg=#51412a
]])
