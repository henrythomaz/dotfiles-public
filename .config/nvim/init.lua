require("config.netrw")
require("config.kill-netrw")
require("config.diagnostics")

if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")
