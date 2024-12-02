return {
  'echasnovski/mini.jump',
  version = false,

  config = function()
    -- Ensure the catppuccin colorscheme is active

    -- Manually set foreground and background colors
    vim.api.nvim_set_hl(0, 'MiniJump', {
      fg = "#52dbbd",  -- Example foreground color (light font color from catppuccin)
      bg = "#303a50",  -- `mocha` background color from catppuccin
    })

    -- Setup mini.jump with your desired mappings
    require('mini.jump').setup({
      mappings = {
        forward = 'f',
        backward = 'F',
        forward_till = 't',
        backward_till = 'T',
        repeat_jump = ';',
      },
      delay = {
        highlight = 250,
        idle_stop = 3000,
      },
      hl = 'MiniJump',  -- Apply the custom highlight group
    })
  end
}
