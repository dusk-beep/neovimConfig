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

vim.diagnostic.config({ virtual_text = false })

-- Set up a keybinding to show diagnostics in a floating window
vim.api.nvim_set_keymap(
	"n",
	"<leader>e",
	':lua vim.diagnostic.open_float(nil, { focus = false, border = "rounded", source = "always", severity = vim.diagnostic.severity.ERROR })<CR>',
	{ noremap = true, silent = true, desc = "pretty diagnostics" }
)

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

-- Set vim.diagnostic to true when file type
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		local clients = vim.lsp.get_clients({ bufnr = 0 })
		if vim.tbl_isempty(clients) then
			vim.diagnostic.config({ virtual_text = true })
		end
	end,
})
-- Delete all marks on startup
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("delmarks 0-9 a-z A-Z") -- Delete all marks from a-z and A-Z
	end,
})

-- Define a new highlight group with color #152238
vim.api.nvim_command("highlight navyblue guifg=#24273a")
vim.api.nvim_command("highlight sky guifg=#89dceb")
vim.api.nvim_command("highlight saphire guifg=#74c7ec")
vim.api.nvim_command("highlight selectItem cterm=bold gui=bold guibg=#74c7ec guifg=#181926")
