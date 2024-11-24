return {
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({
        bind = true, -- Mandatory, otherwise border config won't work
        floating_window = true, -- Show signature in floating window
        hint_enable = true, -- Enable virtual text hints
        handler_opts = {
          border = "rounded", -- Border style: "single", "double", "rounded", etc.
        },
        zindex = 50, -- Z-index for the floating window
        toggle_key = "<M-x>", -- Key to toggle signature display
      })
    end,
  },
}
