local M = {}

M.autoformat = true

function M.toggleAutoformat()
	M.autoformat = not M.autoformat
	if M.autoformat then
		vim.notify("Autoformat enabled", vim.log.levels.INFO)
	else
		vim.notify("Autoformat disabled", vim.log.levels.WARN)
	end
end

function M.toggleInlayHints()
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
	vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
	if not enabled then
		vim.notify("Inlay hints enabled", vim.log.levels.INFO)
	else
		vim.notify("Inlay hints disabled", vim.log.levels.WARN)
	end
end

return M
