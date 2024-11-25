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
vim.opt.undofile = true  -- Enable persistent undo
-- Optional: Maximum number of undo levels
vim.opt.undolevels = 250

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    require("harpoon.mark").clear_all()
  end
})

