return {
  {
    'HiPhish/rainbow-delimiters.nvim',
    lazy = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('rainbow-delimiters')  -- Ensure the module is loaded first

      -- Now you can configure the settings
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = require('rainbow-delimiters').strategy['global'],  -- Global strategy
          vim = require('rainbow-delimiters').strategy['local'],     -- Local strategy for Vim
        },
        query = {
          [''] = 'rainbow-delimiters',  -- Default query
          lua = 'rainbow-blocks',        -- Lua specific query
        },
        priority = {
          [''] = 110,   -- Default priority
          lua = 210,    -- Priority for Lua
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }

      -- Set up the plugin if it has a setup function
      if require('rainbow-delimiters').setup then
        require('rainbow-delimiters').setup(vim.g.rainbow_delimiters)
      end
    end,
  }
}
