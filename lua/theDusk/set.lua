vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

--vim.opt.smartindent = true

-- Enable line wrapping with smart options
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3)
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"
vim.opt.undofile = true -- Enable persistent undo
-- Optional: Maximum number of undo levels
vim.opt.undolevels = 250

-- vim.diagnostic.config({ virtual_text = false })

-- Set up a keybinding to show diagnostics in a floating window
vim.api.nvim_set_keymap(
	"n",
	"<leader>e",
	':lua vim.diagnostic.open_float(nil, { focus = false, border = "rounded", source = "always", severity = vim.diagnostic.severity.ERROR })<CR>',
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false

-- Set up pretty unicode diagnostic signs
vim.fn.sign_define(
	"DiagnosticSignError",
	{ text = "", hl = "DiagnosticSignError", texthl = "DiagnosticSignError", culhl = "DiagnosticSignErrorLine" }
)
vim.fn.sign_define(
	"DiagnosticSignWarn",
	{ text = "", hl = "DiagnosticSignWarn", texthl = "DiagnosticSignWarn", culhl = "DiagnosticSignWarnLine" }
)
vim.fn.sign_define(
	"DiagnosticSignInfo",
	{ text = "", hl = "DiagnosticSignInfo", texthl = "DiagnosticSignInfo", culhl = "DiagnosticSignInfoLine" }
)
vim.fn.sign_define(
	"DiagnosticSignHint",
	{ text = "", hl = "DiagnosticSignHint", texthl = "DiagnosticSignHint", culhl = "DiagnosticSignHintLine" }
)

vim.o.grepprg = [[rg --glob "!.git" --no-heading --vimgrep --follow $*]]
vim.opt.grepformat = vim.opt.grepformat ^ { "%f:%l:%c:%m" }
