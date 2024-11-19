return {
  "ThePrimeagen/harpoon",
  config = function()
    local harpoon = require("harpoon")

    -- Setup keybindings for Harpoon
    vim.api.nvim_set_keymap('n', '<Leader>M', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>m', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true, silent = true })
  end
}
