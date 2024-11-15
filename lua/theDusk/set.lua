vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

--vim.opt.smartindent = true

vim.opt.wrap = true
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

-- Toggle Neotree and current window focus
vim.api.nvim_set_keymap('n', '<leader>n', [[
  lua require('neo-tree').toggle() 
  vim.cmd('wincmd p')  -- Switch focus back to previous window
]], { noremap = true, silent = true })
