local M = {}

local state = {
	buf = nil,
	win = nil,
}

local function is_valid_buf(buf)
	return buf and vim.api.nvim_buf_is_valid(buf)
end

local function is_valid_win(win)
	return win and vim.api.nvim_win_is_valid(win)
end

function M.toggle(opts)
	opts = opts or {}

	-- Se a janela existe, fecha
	if is_valid_win(state.win) then
		vim.api.nvim_win_close(state.win, true)
		state.win = nil
		return
	end

	local columns = vim.o.columns
	local lines = vim.o.lines

	local width = opts.width or math.floor(columns * 0.8)
	local height = opts.height or math.floor(lines * 0.8)

	local row = math.floor((lines - height) / 2)
	local col = math.floor((columns - width) / 2)

	-- Reusa o buffer se ainda existir
	if not is_valid_buf(state.buf) then
		state.buf = vim.api.nvim_create_buf(false, true)
	end

	state.win = vim.api.nvim_open_win(state.buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = opts.border or "rounded",
	})

	-- Só abre o terminal se o buffer ainda não for um terminal
	if vim.bo[state.buf].buftype ~= "terminal" then
		vim.fn.termopen(vim.o.shell)
	end

	vim.cmd("startinsert")
end

return M
