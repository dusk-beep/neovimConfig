return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- Choose from "latte", "frappe", "macchiato", "mocha"
			integrations = {
				blink_cmp = true,
				snacks = true,
				lsp_trouble = true,
				which_key = true,
				indent_blankline = {
					enabled = true,
					scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
					colored_indent_levels = true,
				},
				ts_rainbow = true,
				ts_rainbow2 = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
		vim.cmd("highlight LineNr guifg=#89b4fa")
	end,
}
