return {
	-- ══════════════════════════════════════════════════════════
	-- Mason - Gerenciador de LSP servers e tools
	-- ══════════════════════════════════════════════════════════
	{
		"mason-org/mason.nvim", -- craftzdog usa o correto
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				-- Lua tools
				"stylua", -- Formatter
				"selene", -- Linter
				"luacheck", -- Linter

				-- Shell tools
				"shellcheck", -- Linter
				"shfmt", -- Formatter

				-- Web dev LSP servers
				"tailwindcss-language-server",
				"typescript-language-server",
				"css-lsp",
				"html-lsp",

				-- Adicione mais se precisar:
				-- "prettier",
				-- "eslint_d",
				-- "json-lsp",
			})
		end,
	},

	-- ══════════════════════════════════════════════════════════
	-- LSP Config - Configurações dos language servers
	-- ══════════════════════════════════════════════════════════
	{
		"neovim/nvim-lspconfig",
		opts = {
			-- Inlay hints - escolha true ou false
			inlay_hints = { enabled = false }, -- craftzdog: false, JazzyGrim: true
			-- Se ativar, use <leader>i para toggle (definido em keymaps)

			---@type lspconfig.options
			servers = {
				-- CSS
				cssls = {},

				-- Tailwind CSS
				tailwindcss = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
				},

				-- TypeScript/JavaScript
				ts_ls = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern("tsconfig.json", "package.json")(...)
					end,
					single_file_support = false,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},

				-- HTML
				html = {},

				-- YAML (do craftzdog - útil!)
				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
						},
					},
				},

				-- Lua
				lua_ls = {
					single_file_support = true,
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								workspaceWord = true,
								callSnippet = "Both",
							},
							misc = {
								parameters = {},
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
							doc = {
								privateName = { "^_" },
							},
							type = {
								castNumberToInteger = true,
							},
							diagnostics = {
								disable = { "incomplete-signature-doc", "trailing-space" },
								groupSeverity = {
									strong = "Warning",
									strict = "Warning",
								},
								groupFileStatus = {
									["ambiguity"] = "Opened",
									["await"] = "Opened",
									["codestyle"] = "None",
									["duplicate"] = "Opened",
									["global"] = "Opened",
									["luadoc"] = "Opened",
									["redefined"] = "Opened",
									["strict"] = "Opened",
									["strong"] = "Opened",
									["type-check"] = "Opened",
									["unbalanced"] = "Opened",
									["unused"] = "Opened",
								},
								unusedLocalExclude = { "_*" },
							},
							format = {
								enable = false,
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
									continuation_indent_size = "2",
								},
							},
						},
					},
				},
			},
			setup = {},
		},
	},

	-- ══════════════════════════════════════════════════════════
	-- LSP Keymaps FIX (do craftzdog - ESSENCIAL!)
	-- Este fix resolve problemas de goto definition
	-- ══════════════════════════════════════════════════════════
	{
		"neovim/nvim-lspconfig",
		opts = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			vim.list_extend(keys, {
				{
					"gd",
					function()
						-- NÃO REUTILIZA JANELA - previne bugs!
						require("telescope.builtin").lsp_definitions({ reuse_win = false })
					end,
					desc = "Goto Definition",
					has = "definition",
				},
			})
		end,
	},

	-- ══════════════════════════════════════════════════════════
	-- Emoji completion (do JazzyGrim - opcional mas legal!)
	-- ══════════════════════════════════════════════════════════
	{
		"nvim-cmp",
		dependencies = { "hrsh7th/cmp-emoji" },
		opts = function(_, opts)
			table.insert(opts.sources, { name = "emoji" })
		end,
	},
}
