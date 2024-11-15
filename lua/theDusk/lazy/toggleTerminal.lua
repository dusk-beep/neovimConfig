return {
  {
    'akinsho/toggleterm.nvim', -- Plugin name
    version = "*", -- Use any version of the plugin
    config = function()
      require("toggleterm").setup({
        size = 12, -- Default size of the terminal window
        open_mapping = nil, -- Remove default keybinding for the plugin
        direction = 'horizontal', -- Terminal layout (you can change to 'vertical' if needed)
        start_in_insert = true,  -- Ensure the terminal opens in insert mode by default
        insert_mappings = false, -- Disable terminal mappings in insert mode
      })

      -- Key mapping for normal mode to toggle terminal
      vim.api.nvim_set_keymap('n', '<leader>t', ':ToggleTerm<CR>', { noremap = true, silent = true })

      -- Key mapping for terminal mode to exit to normal mode
      vim.api.nvim_set_keymap('t', '<esc>', '<C-\\><C-n>', { noremap = true, silent = true })
    end,
    opts = {
      size = 12,
      direction = 'horizontal',
    },
  },
}
