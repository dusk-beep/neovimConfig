return {
  'echasnovski/mini.files', version = false,

  config = function ()
    require('mini.files').setup()
  end,

  vim.keymap.set("n", "<leader>l", function()
    vim.cmd("lua MiniFiles.open()")
  end, { desc = "Open MiniFiles" })

}
