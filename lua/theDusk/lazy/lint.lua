return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			javascript = { "eslint" },
			typescript = { "eslint" },
			python = { "ruff" },
			cpp = { "clangtidy" },
			c = { "clangtidy" },
			css = { "stylelint" },
			json = { "jsonlint" },
		}

		-- Automatically lint on save
		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
