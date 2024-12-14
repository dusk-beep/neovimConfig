return {
	{
		"hrsh7th/nvim-cmp", -- Completion framework
		dependencies = {
			"hrsh7th/cmp-buffer", -- Buffer completion source
			"hrsh7th/cmp-nvim-lsp", -- LSP completion source
			"saadparwaiz1/cmp_luasnip", -- Snippet completion source
			"L3MON4D3/LuaSnip", -- Snippet engine
			"rafamadriz/friendly-snippets", -- Collection of snippets
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				enabled = function()
					local context = require("cmp.config.context")
					if vim.api.nvim_get_mode().mode == "c" then
						return true
					else
						return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
					end
				end,
				formatting = {
					format = function(entry, vim_item)
						vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
						return vim_item
					end,
				},
				mapping = {
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["~"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<C-g>"] = function()
						if cmp.visible_docs() then
							cmp.close_docs()
						else
							cmp.open_docs()
						end
					end,

					["<C-k>"] = cmp.mapping.scroll_docs(-4),
					["<C-j>"] = cmp.mapping.scroll_docs(4),

					["@"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump() -- Expand or jump to the next snippet placeholder
						else
							fallback() -- If no snippet, fall back to default action (e.g., indent)
						end
					end, { "i", "s" }),
				},

				-- Sources for completion
				sources = {
					{ name = "nvim_lsp", max_item_count = 10 },
					{ name = "nvim_lsp_signature_help" },
				},
				completion = {
					completeopt = "menuone,noinsert,noselect", -- Disable auto-completion window
					max_height = 10,
					max_width = 30,
				},
				window = {
					completion = cmp.config.window.bordered({
						border = "rounded",
					}),
					documentation = cmp.config.window.bordered({
						border = "rounded",
						max_height = 50,
					}),
				},
			})
			-- Configure LSP servers
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			local attach = function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show hover info
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename symbol
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- codeaction
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- Show all references
				vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts) --signature
				vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, opts) -- defination type
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- go to implementatuon
				vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts) -- Search workspace symbols
			end

			lspconfig.clangd.setup({
				capabilities = capabilities,
				on_attach = attach,
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				on_attach = attach,
			})

			lspconfig.html.setup({
				filetypes = { "html", "htmldjango" },
				capabilities = capabilities,

				on_attach = attach,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
				on_attach = attach,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				on_attach = attach,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			})

			for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
				local default_diagnostic_handler = vim.lsp.handlers[method]
				vim.lsp.handlers[method] = function(err, result, context, config)
					if err ~= nil and err.code == -32802 then
						return
					end
					return default_diagnostic_handler(err, result, context, config)
				end
			end

			-- Lua Language Server Configuration
			lspconfig.lua_ls.setup({
				capabilities = capabilities, -- Reuse existing capabilities
				on_attach = attach,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT", -- Lua runtime version used by Neovim
							path = vim.split(package.path, ";"), -- Lua package path
						},
						diagnostics = {
							globals = { "vim" }, -- Recognize `vim` global
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true), -- Load Neovim runtime files
							checkThirdParty = false, -- Prevent annoying pop-ups for third-party tools
						},
						telemetry = {
							enable = false, -- Disable telemetry for better performance
						},
					},
				},
			})

			lspconfig.gopls.setup({
				capabilities = capabilities, -- Reuse existing capabilities (like autocompletion support)
				on_attach = attach,
				settings = {
					gopls = {
						gofumpt = true, -- Enforce `gofumpt` formatting
						staticcheck = true, -- Enable static analysis (linting)
						analyses = {
							unusedparams = true, -- Report unused function parameters
						},
					},
				},
			})

			-- Configure Pyright
			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_attach = attach,
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic", -- Options: off, basic, strict
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			})
		end,
	},
}
