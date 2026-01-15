-- ══════════════════════════════════════════════════════════
-- Auto-disable paste mode (do craftzdog)
-- ══════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- ══════════════════════════════════════════════════════════
-- Disable concealing (do craftzdog - IMPORTANTE!)
-- ══════════════════════════════════════════════════════════
-- LazyVim esconde caracteres por padrão (conceallevel=3)
-- Isso é ruim para JSON (esconde aspas) e Markdown (esconde *)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- ══════════════════════════════════════════════════════════
-- Autocmds Adicionais Úteis (opcionais)
-- ══════════════════════════════════════════════════════════

-- Auto-format antes de salvar (se quiser)
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function()
--     vim.lsp.buf.format()
--   end,
-- })

-- Highlight ao copiar (yank feedback visual)
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})

-- Remove trailing whitespace ao salvar
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local cursor_pos = vim.api.nvim_win_get_cursor(0)
		vim.cmd([[%s/\s\+$//e]])
		vim.api.nvim_win_set_cursor(0, cursor_pos)
	end,
})

-- Auto-resize splits quando redimensionar janela
vim.api.nvim_create_autocmd("VimResized", {
	pattern = "*",
	command = "wincmd =",
})

-- Fechar certos tipos de janela com 'q'
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"qf",
		"help",
		"man",
		"notify",
		"lspinfo",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"PlenaryTestPopup",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})
