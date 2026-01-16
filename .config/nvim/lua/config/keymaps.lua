local discipline = require("craftzdog.discipline")
discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local floaterminal = require("craftzdog.floaterminal")

-- ══════════════════════════════════════════════════════════
-- Proteção de Registers (do craftzdog - essencial!)
-- ══════════════════════════════════════════════════════════
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- ══════════════════════════════════════════════════════════
-- Increment/decrement e Select all
-- ══════════════════════════════════════════════════════════
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Delete word backwards
keymap.set("n", "dw", 'vb"_d')

-- ══════════════════════════════════════════════════════════
-- Save/Quit rápido (do JazzyGrim)
-- ══════════════════════════════════════════════════════════
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- ══════════════════════════════════════════════════════════
-- File Explorer (adapte para o que você usar)
-- ══════════════════════════════════════════════════════════
-- Se usar NvimTree (JazzyGrim style):
keymap.set("n", "<Leader>f", ":NvimTreeToggle<Return>", opts)
-- Se usar neo-tree (LazyVim default), comente as linhas acima

-- ══════════════════════════════════════════════════════════
-- Disable continuations (do craftzdog)
-- ══════════════════════════════════════════════════════════
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- ══════════════════════════════════════════════════════════
-- Tabs
-- ══════════════════════════════════════════════════════════
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts) -- do JazzyGrim

-- ══════════════════════════════════════════════════════════
-- Split/Move window (igual nos dois)
-- ══════════════════════════════════════════════════════════
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize (mantendo as setas do craftzdog - mais intuitivo)
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- jk para sair do modo terminal
keymap.set("t", "jk", "<C-\\><C-n>", opts)
keymap.set("t", "kj", "<C-\\><C-n>", opts)

-- ══════════════════════════════════════════════════════════
-- Diagnostics e LSP (do craftzdog)
-- ══════════════════════════════════════════════════════════
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
	require("craftzdog.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<leader>i", function()
	require("craftzdog.lsp").toggleInlayHints()
end)

vim.api.nvim_create_user_command("ToggleAutoformat", function()
	require("craftzdog.lsp").toggleAutoformat()
end, {})

keymap.set("n", ";t", function()
	floaterminal.toggle()
end)
