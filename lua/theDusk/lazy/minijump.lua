return {
  'echasnovski/mini.jump', version = false,
  
  config = function()
    require('mini.jump').setup({
      -- Your configuration here
      mappings = {
        forward = 'f',
        backward = 'F',
        forward_till = 't',
        backward_till = 'T',
        repeat_jump = ';',
      },
      delay = {
        highlight = 250,
        idle_stop = 1000,
      },
    })
  end
}
