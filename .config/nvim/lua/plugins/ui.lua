return {
	-- ══════════════════════════════════════════════════════════
	-- Noice.nvim - Better UI for messages, cmdline and popupmenu
	-- ══════════════════════════════════════════════════════════
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})

			-- Focus tracking
			local focused = true
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					focused = true
				end,
			})
			vim.api.nvim_create_autocmd("FocusLost", {
				callback = function()
					focused = false
				end,
			})

			table.insert(opts.routes, 1, {
				filter = {
					cond = function()
						return not focused
					end,
				},
				view = "notify_send",
				opts = { stop = false },
			})

			opts.commands = {
				all = {
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}

			-- Markdown keys
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					vim.schedule(function()
						require("noice.text.markdown").keys(event.buf)
					end)
				end,
			})

			opts.presets.lsp_doc_border = true
		end,
	},

	-- ══════════════════════════════════════════════════════════
	-- Notify - Notificações bonitas
	-- ══════════════════════════════════════════════════════════
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
			background_colour = "#000000",
			render = "wrapped-compact",
		},
	},

	-- ══════════════════════════════════════════════════════════
	-- Snacks.nvim
	-- ══════════════════════════════════════════════════════════
	{
		"snacks.nvim",
		opts = {
			scroll = { enabled = false },
		},
		keys = {},
	},

	-- ══════════════════════════════════════════════════════════
	-- Bufferline - Tab/Buffer line no topo
	-- ══════════════════════════════════════════════════════════
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "tabs",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},

	-- ══════════════════════════════════════════════════════════
	-- Incline - Filename floating (adaptado para Sonokai)
	-- ══════════════════════════════════════════════════════════
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local helpers = require("incline.helpers")
			require("incline").setup({
				window = {
					padding = 0,
					margin = { horizontal = 0, vertical = 0 },
				},
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
					local modified = vim.bo[props.buf].modified

					return {
						ft_icon and {
							" ",
							ft_icon,
							" ",
							guibg = ft_color,
							guifg = helpers.contrast_color(ft_color),
						} or "",
						" ",
						{ filename, gui = modified and "bold,italic" or "bold" },
						modified and { " [+]", guifg = "#d7ba7d" } or "",
						" ",
						guibg = "#2c2e34", -- Cor compatível com Sonokai
					}
				end,
			})
		end,
	},

	-- ══════════════════════════════════════════════════════════
	-- Lualine - Statusline (do craftzdog)
	-- ══════════════════════════════════════════════════════════
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			local LazyVim = require("lazyvim.util")
			opts.sections.lualine_c[4] = {
				LazyVim.lualine.pretty_path({
					length = 0,
					relative = "cwd",
					modified_hl = "MatchParen",
					directory_hl = "",
					filename_hl = "Bold",
					modified_sign = "",
					readonly_icon = " 󰌾 ",
				}),
			}
		end,
	},

	-- ══════════════════════════════════════════════════════════
	-- LazyGit - ESSENCIAL! (do JazzyGrim)
	-- ══════════════════════════════════════════════════════════
	{
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				";c",
				"<cmd>LazyGit<cr>",
				desc = "LazyGit",
			},
		},
	},

	-- ══════════════════════════════════════════════════════════
	-- NvimTree - File Explorer (do JazzyGrim)
	-- ══════════════════════════════════════════════════════════
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
			{ "<leader>f", "<cmd>NvimTreeFindFile<cr>", desc = "Find file in NvimTree" },
		},
		config = function()
			require("nvim-tree").setup({
				on_attach = function(bufnr)
					local api = require("nvim-tree.api")
					local function opts(desc)
						return {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						}
					end

					-- Default mappings
					api.config.mappings.default_on_attach(bufnr)

					-- Custom mappings
					vim.keymap.set("n", "t", api.node.open.tab, opts("Open in tab"))
				end,
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 30,
					relativenumber = true,
				},
				renderer = {
					group_empty = true,
					icons = {
						show = {
							git = true,
							folder = true,
							file = true,
							folder_arrow = true,
						},
					},
				},
				filters = {
					dotfiles = false, -- Mostra dotfiles
					custom = {
						"node_modules",
						".git",
						".cache",
					},
				},
			})
		end,
	},

	-- ══════════════════════════════════════════════════════════
	-- Zen Mode - Foco total (do craftzdog)
	-- ══════════════════════════════════════════════════════════
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		keys = {
			{ "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
		},
	},

	-- ══════════════════════════════════════════════════════════
	-- Dashboard - Tela inicial (customizado)
	-- ══════════════════════════════════════════════════════════
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					header = [[
 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]],
				},
			},
		},
	},

	-- ══════════════════════════════════════════════════════════
	-- Database UI - Opcional (do JazzyGrim)
	-- Descomente se trabalhar com databases
	-- ══════════════════════════════════════════════════════════
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
		keys = {
			{
				"<leader>db",
				"<cmd>NvimTreeClose<cr><cmd>tabnew<cr><bar><bar><cmd>DBUI<cr>",
				desc = "Database UI",
			},
		},
	},

	-- Disable render-markdown (do craftzdog)
	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = false,
	},
}
