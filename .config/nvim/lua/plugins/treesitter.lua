return {
	-- ══════════════════════════════════════════════════════════
	-- Treesitter Playground (Debug syntax tree)
	-- ══════════════════════════════════════════════════════════
	{
		"nvim-treesitter/playground",
		cmd = "TSPlaygroundToggle",
	},

	-- ══════════════════════════════════════════════════════════
	-- Treesitter - Syntax highlighting e parsing
	-- ══════════════════════════════════════════════════════════
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			-- Adiciona linguagens à configuração do LazyVim
			vim.list_extend(opts.ensure_installed, {
				-- Web Dev
				"javascript",
				"typescript",
				"tsx",
				"css",
				"html",
				"json",
				"scss",
				"graphql",
				"http",

				-- Frameworks modernos
				"astro",
				"svelte",
				"vue",

				-- Backend
				"rust",
				"go",
				"python",
				"java",
				"php",

				-- Systems
				"c",
				"cpp",
				"cmake",

				-- Config files
				"lua",
				"vim",
				"yaml",
				"toml",
				"gitignore",

				-- Database
				"sql",

				-- Shell
				"bash",
				"fish",

				-- Markdown
				"markdown",
				"markdown_inline",

				-- Regex
				"regex",
			})

			-- Query linter
			opts.query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			}

			-- Playground
			opts.playground = {
				enable = true,
				disable = {},
				updatetime = 25,
				persist_queries = true,
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			}
		end,
	},

	-- ══════════════════════════════════════════════════════════
	-- MDX Support (React/Next.js)
	-- ══════════════════════════════════════════════════════════
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "mdx" })
			end
		end,
		config = function(_, opts)
			-- Registra MDX como markdown
			vim.filetype.add({
				extension = {
					mdx = "mdx",
				},
			})
			vim.treesitter.language.register("markdown", "mdx")
		end,
	},

	-- ══════════════════════════════════════════════════════════
	-- Treesitter Context (mostra contexto no topo)
	-- ══════════════════════════════════════════════════════════
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		opts = {
			enable = true,
			max_lines = 3,
			min_window_height = 0,
			patterns = {
				default = {
					"class",
					"function",
					"method",
					"for",
					"while",
					"if",
					"switch",
					"case",
				},
			},
		},
	},
}
