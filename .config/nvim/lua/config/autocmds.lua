-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- Prevenir que neo-tree abra automaticamente ao abrir um diretório
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function(data)
		-- buffer é um diretório
		local directory = vim.fn.isdirectory(data.file) == 1

		if directory then
			-- Não fazer nada - deixar o dashboard ou tela vazia
			-- O usuário pode abrir manualmente com <leader>e
			return
		end
	end,
})
-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- 🚫 PREVENIR que neo-tree abra automaticamente ao abrir diretório
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function(data)
		local directory = vim.fn.isdirectory(data.file) == 1

		if directory then
			-- Fechar TODOS os buffers do neo-tree que foram abertos automaticamente
			vim.defer_fn(function()
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.bo[buf].filetype == "neo-tree" then
						vim.api.nvim_buf_delete(buf, { force = true })
					end
				end
			end, 10)
		end
	end,
})
