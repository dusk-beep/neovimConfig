return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- Choose from "latte", "frappe", "macchiato", "mocha"
    })
    vim.cmd.colorscheme("catppuccin")
    vim.cmd('highlight LineNr guifg=#89b4fa')
  end,
}
