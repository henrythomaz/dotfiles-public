return {
	-- mensagens, cmdline e popupmenu
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

			opts.presets = opts.presets or {}
			opts.presets.lsp_doc_border = true
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = { timeout = 5000 },
	},

	-- Ícones (obrigatório)
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},

	-- BUFFERLINE: abas tipo Chrome
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "buffers",
				separator_style = "thin",
				always_show_bufferline = true,
				show_buffer_close_icons = true,
				show_close_icon = false,
				color_icons = true,
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "neo-tree",
						text = "Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
			},
			highlights = {
				fill = { bg = "NONE" },
				background = { bg = "NONE" },
				tab = { bg = "NONE" },
				tab_selected = { fg = "#ffd866", bold = true },
				separator = { fg = "#3b3a32", bg = "NONE" },
				separator_selected = { fg = "#ffd866" },
			},
		},
	},

	-- NEOTREE
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			window = {
				position = "left",
				width = 32,
				border = "rounded",
			},
			filesystem = {
				filtered_items = {
					visible = true,
				},
			},
			default_component_configs = {
				container = {
					enable_character_fade = false,
				},
			},
		},
	},

	-- INCLINE (filename flutuando no topo)
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		priority = 1200,
		config = function()
			require("incline").setup({
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = { cursorline = true },
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return {
						{ icon, guifg = color },
						{ " " },
						{ filename, gui = vim.bo[props.buf].modified and "bold" or nil },
					}
				end,
			})
		end,
	},

	-- LUALINE (Monokai Pro)
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				theme = "monokai-pro",
				globalstatus = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
		},
	},

	-- ZEN MODE
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false },
			},
		},
		keys = {
			{ "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
		},
	},
	-- SNACKS (com explorer desabilitado)
	{
		"folke/snacks.nvim",
		opts = {
			-- Desabilita o explorer do Snacks
			explorer = { enabled = false },

			dashboard = {
				preset = {
					header = [[
     ██╗  ██╗███████╗███╗   ██╗██████╗ ██╗   ██╗
     ██║  ██║██╔════╝████╗  ██║██╔══██╗╚██╗ ██╔╝
     ███████║█████╗  ██╔██╗ ██║██████╔╝ ╚████╔╝ 
     ██╔══██║██╔══╝  ██║╚██╗██║██╔══██╗  ╚██╔╝  
     ██║  ██║███████╗██║ ╚████║██║  ██║   ██║   
     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝   ╚═╝   
]],
				},
			},
		},
	},
}
