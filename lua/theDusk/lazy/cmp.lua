return {
    "hrsh7th/nvim-cmp",                -- Completion framework
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",        -- LSP source for nvim-cmp
        "hrsh7th/cmp-buffer",          -- Buffer completion source
        "hrsh7th/cmp-path",            -- Path completion source
        "hrsh7th/cmp-cmdline",         -- Command line completion source
        "saadparwaiz1/cmp_luasnip",    -- Snippet completion source
        "L3MON4D3/LuaSnip",            -- Snippet engine
        "neovim/nvim-lspconfig",       -- LSP configuration
    },
    config = function()
        local cmp = require('cmp')

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For luasnip users.
                end,
            },
            mapping = {
                ['Down'] = cmp.mapping.select_next_item(),
                ['Up'] = cmp.mapping.select_prev_item(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            },
            sources = {
                { name = 'buffer' },
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'luasnip' },
            },
        })

        -- LSP Configuration
        --[[local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('lspconfig').lua_ls.setup({
            capabilities = capabilities,
        })
--]]
        -- Additional language servers can be added similarly
        -- require('lspconfig').another_language_server.setup({
        --     capabilities = capabilities,
        -- })
    end
}
