return {
	-- ══════════════════════════════════════════════════════════
	-- Neotest - Test runner integrado
	-- ══════════════════════════════════════════════════════════
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",

			-- Adapters (adicione o que você usa)
			"nvim-neotest/neotest-jest", -- JavaScript/TypeScript
			"nvim-neotest/neotest-plenary", -- Lua
			-- "nvim-neotest/neotest-python",  -- Python
			-- "nvim-neotest/neotest-go",      -- Go
			-- "nvim-neotest/neotest-rust",    -- Rust
		},
		opts = {
			adapters = {
				["neotest-plenary"] = {},
				["neotest-jest"] = {
					jestConfigFile = function()
						local file = vim.fn.expand("%:p")
						if string.find(file, "/packages/") then
							return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
						end
						return vim.fn.getcwd() .. "/jest.config.ts"
					end,
					cwd = function()
						local file = vim.fn.expand("%:p")
						if string.find(file, "/packages/") then
							return string.match(file, "(.-/[^/]+/)src")
						end
						return vim.fn.getcwd()
					end,
				},
			},
			status = { virtual_text = true },
			output = { open_on_run = true },
			quickfix = {
				open = function()
					if require("lazyvim.util").has("trouble.nvim") then
						require("trouble").open({ mode = "quickfix", focus = false })
					else
						vim.cmd("copen")
					end
				end,
			},
		},
		config = function(_, opts)
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)

			if require("lazyvim.util").has("trouble.nvim") then
				opts.consumers = opts.consumers or {}
				opts.consumers.trouble = function(client)
					client.listeners.results = function(adapter_id, results, partial)
						if partial then
							return
						end
						local tree = assert(client:get_position(nil, { adapter = adapter_id }))

						local failed = 0
						for pos_id, result in pairs(results) do
							if result.status == "failed" and tree:get_key(pos_id) then
								failed = failed + 1
							end
						end
						vim.schedule(function()
							local trouble = require("trouble")
							if trouble.is_open() then
								trouble.refresh()
								if failed == 0 then
									trouble.close()
								end
							end
						end)
						return {}
					end
				end
			end

			if opts.adapters then
				local adapters = {}
				for name, config in pairs(opts.adapters or {}) do
					if type(name) == "number" then
						if type(config) == "string" then
							config = require(config)
						end
						adapters[#adapters + 1] = config
					elseif config ~= false then
						local adapter = require(name)
						if type(config) == "table" and not vim.tbl_isempty(config) then
							if adapter.setup then
								adapter.setup(config)
							elseif getmetatable(adapter) and getmetatable(adapter).__call then
								adapter(config)
							else
								error("Adapter " .. name .. " does not support setup")
							end
						end
						adapters[#adapters + 1] = adapter
					end
				end
				opts.adapters = adapters
			end

			require("neotest").setup(opts)
		end,
		keys = {
			{
				";tt",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run File Tests",
			},
			{
				";tr",
				function()
					require("neotest").run.run()
				end,
				desc = "Run Nearest Test",
			},
			{
				";tT",
				function()
					require("neotest").run.run(vim.loop.cwd())
				end,
				desc = "Run All Tests",
			},
			{
				";tl",
				function()
					require("neotest").run.run_last()
				end,
				desc = "Run Last Test",
			},
			{
				";ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Toggle Test Summary",
			},
			{
				";to",
				function()
					require("neotest").output.open({ enter = true, auto_close = true })
				end,
				desc = "Show Test Output",
			},
			{
				";tO",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Toggle Output Panel",
			},
			{
				";tS",
				function()
					require("neotest").run.stop()
				end,
				desc = "Stop Tests",
			},
		},
	},
}
