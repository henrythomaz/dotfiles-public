local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- ══════════════════════════════════════════════════════════
		-- LazyVim Base
		-- ══════════════════════════════════════════════════════════
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
			opts = {
				colorscheme = "sonokai",
				news = {
					lazyvim = true,
					neovim = true,
				},
			},
		},

		-- ══════════════════════════════════════════════════════════
		-- Extras Essenciais (linting e formatting)
		-- ══════════════════════════════════════════════════════════
		{ import = "lazyvim.plugins.extras.linting.eslint" },
		{ import = "lazyvim.plugins.extras.formatting.prettier" },

		-- ══════════════════════════════════════════════════════════
		-- Language Support
		-- ══════════════════════════════════════════════════════════
		{ import = "lazyvim.plugins.extras.lang.typescript" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.tailwind" },
		{ import = "lazyvim.plugins.extras.lang.rust" },
		{ import = "lazyvim.plugins.extras.lang.python" },
		{ import = "lazyvim.plugins.extras.lang.markdown" },

		-- Go só se você usar (comente se não usar)
		-- { import = "lazyvim.plugins.extras.lang.go" },

		-- ══════════════════════════════════════════════════════════
		-- Copilot - REMOVIDA A LINHA PROBLEMÁTICA!
		-- Agora vem do seu coding.lua customizado
		-- ══════════════════════════════════════════════════════════
		-- { import = "lazyvim.plugins.extras.coding.copilot" },  ← REMOVIDO!

		-- ══════════════════════════════════════════════════════════
		-- Utilities
		-- ══════════════════════════════════════════════════════════
		{ import = "lazyvim.plugins.extras.util.mini-hipatterns" },
		{ import = "lazyvim.plugins.extras.dap.core" }, -- debugging
		{ import = "lazyvim.plugins.extras.test.core" }, -- testing
		{ import = "lazyvim.plugins.extras.coding.yanky" }, -- clipboard manager
		{ import = "lazyvim.plugins.extras.editor.mini-files" }, -- file explorer
		{ import = "lazyvim.plugins.extras.util.project" }, -- project management

		-- ══════════════════════════════════════════════════════════
		-- Custom Plugins (seus plugins personalizados)
		-- O Copilot está configurado em plugins/coding.lua
		-- ══════════════════════════════════════════════════════════
		{ import = "plugins" },
	},

	defaults = {
		lazy = false,
		version = false,
	},

	dev = {
		path = "~/.ghq/github.com",
	},

	checker = {
		enabled = true,
		notify = false,
	},

	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},

	ui = {
		custom_keys = {
			["<localleader>d"] = function(plugin)
				dd(plugin)
			end,
		},
	},

	debug = false,
})
