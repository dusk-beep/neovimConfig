return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>T",
			function()
				require("conform").format({ async = true })
			end,
			mode = "n", -- Specify normal mode explicitly
			desc = "Format buffer",
		},
	},
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt" },
			python = { "ruff_format" },
			javascript = { "prettier", stop_after_first = true },
			cpp = { "clang-format" },
			json = { "prettier" },
			css = { "prettier" },
			c = { "clang-format" },
			javascriptreact = { "prettier" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = { timeout_ms = 2000 },
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
