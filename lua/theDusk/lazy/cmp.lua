return {
  "hrsh7th/nvim-cmp",  -- Completion framework
  dependencies = {
    "hrsh7th/cmp-buffer",  -- Buffer completion source
    "saadparwaiz1/cmp_luasnip",  -- Snippet completion source
    "L3MON4D3/LuaSnip",  -- Snippet engine
    "rafamadriz/friendly-snippets",  -- Collection of snippets for different languages
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    -- Load VS Code-style snippets (optional)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)  -- Expand the snippet
        end,
      },
      mapping = {
        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()  -- Cycle through completion suggestions
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()  -- Jump to the next placeholder in snippets
          else
            fallback()  -- Default fallback (indent)
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()  -- Cycle backward through completion suggestions
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)  -- Jump to the previous placeholder in snippets
          else
            fallback()  -- Default fallback (outdent)
          end
        end,
        ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm completion with Enter
        ['<C-Space>'] = cmp.mapping.complete(),  -- Manually trigger completion
      },
      sources = {
        { name = 'buffer' },  -- Use current buffer for completion
        { name = 'luasnip' },  -- Snippet completion
      },
      window = {
        completion = {
          col_offset = -3,  -- Adjust the position of the completion window
        },
      },
    })
  end,
}
