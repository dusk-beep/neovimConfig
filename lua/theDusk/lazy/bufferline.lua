return {
  {'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',

    config = function()
      require("bufferline").setup{
        options = {
          numbers = "ordinal",  -- Display buffer numbers as ordinals (1, 2, 3, ...)
          buffer_close_icon = "",  -- Customize the close icon if needed
          modified_icon = "✎",  -- Customize the modified icon if needed
          indicator_icon = "▶",  -- Customize the indicator icon if needed
        }
      }

      -- Adjust to account for 0-based indexing in bufferline
      for i = 1, 9 do
        vim.keymap.set('n', '<Leader>' .. i, function()
          require('bufferline').go_to(i)  -- Adjust to 0-based index
        end, { desc = 'Go to buffer ' .. i })
      end
    end
  }
}
