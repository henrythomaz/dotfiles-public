vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")
