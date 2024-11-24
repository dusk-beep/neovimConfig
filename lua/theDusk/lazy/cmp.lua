return {
  {
    "hrsh7th/nvim-cmp", -- Completion framework
    dependencies = {
      "hrsh7th/cmp-buffer", -- Buffer completion source
      "hrsh7th/cmp-nvim-lsp", -- LSP completion source
      "saadparwaiz1/cmp_luasnip", -- Snippet completion source
      "L3MON4D3/LuaSnip", -- Snippet engine
      "rafamadriz/friendly-snippets", -- Collection of snippets
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Make sure your snippets are loaded correctly
      require("luasnip.loaders.from_vscode").lazy_load()


      -- Complete cmp setup with Tab and Shift-Tab for cycling through completions
      cmp.setup({
        mapping = {
          -- Cycle forward through completion items (buffer, LSP, etc.)
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()  -- Cycle to the next completion item
            else
              fallback()  -- If no completion menu is visible, fall back to the default action (indent)
            end
          end, {'i', 's'}),  -- For insert and select modes

          -- Cycle backward through completion items
          ['~'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()  -- Cycle to the previous completion item
            else
              fallback()  -- Default fallback (outdent)
            end
          end, {'i', 's'}),

          ['<C-k>'] = cmp.mapping.scroll_docs(-4),
          ['<C-j>'] = cmp.mapping.scroll_docs(4),

          -- You can keep this for snippet expansion (if you are using luasnip)
          ['@'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()  -- Expand or jump to the next snippet placeholder
            else
              fallback()  -- If no snippet, fall back to default action (e.g., indent)
            end
          end, {'i', 's'}),

          -- Optional: Confirm completion with Enter
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },

        -- Sources for completion
        sources = {
          { name = 'buffer', priority = 1000 },  -- Buffer completions
          { name = 'nvim_lsp', priority = 100 },  -- LSP completions
        },
        completion = {
          completeopt = 'menuone,noinsert,noselect',  -- Disable auto-completion window
          max_item_count = 10,
        },
        window = {
          completion = cmp.config.window.bordered({
            border = "rounded",
          }),
          documentation = cmp.config.window.bordered({
            border = "rounded"
          }),
        },
      })
      -- Configure LSP servers
      local lspconfig = require("lspconfig")
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Example: Configure clangd
      lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })

        end,
      })

          -- Configure tsserver (JavaScript/TypeScript LSP)
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)  -- Go to definition
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)        -- Show hover info
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)  -- Rename symbol
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
        end,

      })
    end,
  },
}
