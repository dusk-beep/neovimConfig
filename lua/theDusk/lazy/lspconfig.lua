return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		opts = {
			servers = {
				lua_ls = {},
				clangd = {},
				ts_ls = {},
				html = {},
				cssls = {},
				gopls = {},
				pyright = {},
				rust_analyzer = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local blink_cmp = require("blink.cmp")

			-- Define keymaps for LSP
			local on_attach = function(client, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				local keymap = vim.keymap.set

				-- Common LSP keymaps
				keymap("n", "gd", vim.lsp.buf.definition, bufopts) -- Go to definition
				keymap("n", "gD", vim.lsp.buf.declaration, bufopts) -- Go to declaration
				keymap("n", "K", vim.lsp.buf.hover, bufopts) -- Show hover information
				keymap("n", "gi", vim.lsp.buf.implementation, bufopts) -- Go to implementation
				keymap("n", "gr", vim.lsp.buf.references, bufopts) -- Show references
				keymap("n", "<leader>rn", vim.lsp.buf.rename, bufopts) -- Rename symbol
				keymap("n", "<leader>ca", vim.lsp.buf.code_action, bufopts) -- Code action
				keymap({ "n", "i" }, "<c-l>", vim.lsp.buf.signature_help, bufopts) --signature
			end

			-- Set up servers
			for server, config in pairs(opts.servers) do
				config = vim.tbl_deep_extend("force", {
					capabilities = blink_cmp.get_lsp_capabilities(),
					on_attach = on_attach,
				}, config)

				lspconfig[server].setup(config)
			end
		end,
	},
}
