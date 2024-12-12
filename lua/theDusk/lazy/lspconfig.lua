return {
  "neovim/nvim-lspconfig",
  config = function()
    --   require("lspconfig").clangd.setup({
    --     cmd = { "clangd" }, -- Termux's clangd binary
    --     on_attach = function(client, bufnr)
    --       local opts = { noremap = true, silent = true, buffer = bufnr }
    --       vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    --       vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    --       vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    --     end,
    --     capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Optional for autocompletion
    --   })
  end,
}
