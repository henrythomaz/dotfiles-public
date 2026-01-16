-- ══════════════════════════════════════════════════════════
-- Leader Key
-- ══════════════════════════════════════════════════════════
vim.g.mapleader = " "

-- ══════════════════════════════════════════════════════════
-- Encoding
-- ══════════════════════════════════════════════════════════
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- ══════════════════════════════════════════════════════════
-- UI Essentials
-- ══════════════════════════════════════════════════════════
vim.opt.number = true
vim.opt.title = true
vim.opt.showcmd = true
vim.opt.cmdheight = 0 -- Minimalista (do craftzdog)
vim.opt.laststatus = 3 -- Global statusline (do JazzyGrim - melhor!)
vim.opt.scrolloff = 10
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"
vim.opt.mouse = "" -- Sem mouse (forçar keyboard workflow)

-- ══════════════════════════════════════════════════════════
-- Editing Behavior
-- ══════════════════════════════════════════════════════════
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.backspace = { "start", "eol", "indent" }

-- ══════════════════════════════════════════════════════════
-- Search Settings
-- ══════════════════════════════════════════════════════════
vim.opt.hlsearch = true
vim.opt.ignorecase = true -- Case insensitive UNLESS /C or capital
vim.opt.inccommand = "split" -- Preview substitutions

-- ══════════════════════════════════════════════════════════
-- File Handling
-- ══════════════════════════════════════════════════════════
vim.opt.backup = false
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" } -- do JazzyGrim
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })

-- ══════════════════════════════════════════════════════════
-- Shell (ajuste para seu ambiente)
-- ══════════════════════════════════════════════════════════
-- Se você usa Fish shell (como no JazzyGrim):
vim.opt.shell = "fish"
-- Se usa Bash/Zsh, comente a linha acima ou mude para:
-- vim.opt.shell = "bash"

-- ══════════════════════════════════════════════════════════
-- Terminal Features (do JazzyGrim - essencial para LSP!)
-- ══════════════════════════════════════════════════════════
-- Undercurl support (para diagnostics)
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- ══════════════════════════════════════════════════════════
-- Formatting
-- ══════════════════════════════════════════════════════════
vim.opt.formatoptions:append({ "r" }) -- Auto-insert comment leader

-- ══════════════════════════════════════════════════════════
-- File Types (do JazzyGrim - útil para web dev!)
-- ══════════════════════════════════════════════════════════
vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})

-- ══════════════════════════════════════════════════════════
-- LazyVim Configuration (do JazzyGrim - ESSENCIAL!)
-- ══════════════════════════════════════════════════════════
vim.g.lazyvim_prettier_needs_config = true -- Força .prettierrc
vim.g.lazyvim_picker = "telescope" -- Usa Telescope (mais bonito que fzf)
vim.g.lazyvim_cmp = "blink.cmp" -- Completion engine moderno

-- Node.js/TypeScript configs
vim.cmd([[au BufNewFile,BufRead *.tsx setf typescriptreact]])
vim.cmd([[au BufNewFile,BufRead *.jsx setf javascriptreact]])

-- Python configs
vim.cmd([[au BufNewFile,BufRead *.py setlocal shiftwidth=4 tabstop=4]])
